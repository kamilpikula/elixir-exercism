defmodule StatWatch do

  def run() do
    fetch_stats()
    |> save_csv()
  end

  def column_names() do
    Enum.join(~w(DateTime Subscribers Videos Views), ",")
  end

  def fetch_stats() do
    now = DateTime.utc_now()
      |> DateTime.truncate(:second)
      |> DateTime.to_string()

    %{body: body} = HTTPoison.get!(stat_url())
    %{items: [%{statistics: statistics} | _]} = Poison.decode!(body, keys: :atoms)
    [ now,
      statistics.subscriberCount,
      statistics.videoCount,
      statistics.viewCount
    ] |> Enum.join(", ")
  end

  def save_csv(row_of_stats) do
    filename = "stats.csv"
    unless File.exists?(filename) do
      File.write!(filename, column_names() <>  "\n")
    end
    File.write!(filename, row_of_stats <> "\n", [:append])
  end
  def stat_url() do
    youtube_url = "https://www.googleapis.com/youtube/v3/"
    channel = "id=" <> "UCXzjylcASemPIWPrt4_IoZA"
    key = "key=" <> "AIzaSyDujIPsNDb7rQ2bvZWtr7TjiKBOORFR3O0"
    "#{youtube_url}channels?#{channel}&#{key}&part=statistics"
  end
end
