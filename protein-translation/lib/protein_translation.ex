defmodule ProteinTranslation do
  @codons %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP",
  }
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    rna
      |> String.codepoints()
      |> Enum.chunk_every(3)
      |> Enum.map(&Enum.join/1)
      |> clean_protein()
  end

  defp clean_protein(rna) do
    if rna == Enum.filter(rna, &is_codon?/1) do
      translation = Enum.map(rna, &(Map.fetch!(@codons, &1)))
        |> Enum.chunk_by(&(&1 == "STOP")) |> List.first()
      {:ok, translation}
    else
      {:error, "invalid RNA"}
    end
  end
  @doc """
  Given a codon, return the corresponding protein
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    case is_codon?(codon) do
      true -> Map.fetch(@codons, codon)
      false -> {:error, "invalid codon"}
    end
  end

  defp is_codon?(codon) do
    Map.has_key?(@codons, codon)
  end
end
