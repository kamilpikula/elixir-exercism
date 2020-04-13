defmodule AlchemistMarkdownTest do
  use ExUnit.Case
  doctest AlchemistMarkdown

  test "italicizes" do
    str = "Something *important*"
    assert AlchemistMarkdown.to_html(str) =~ "<em>important</em>"
  end

  test "expands big tags" do
    str = "Some ++big++ words!"
    assert AlchemistMarkdown.to_html(str) =~ "<big>big</big> words!"
  end

  test "expands small tags" do
    str = "Some --small-- words!"
    assert AlchemistMarkdown.to_html(str) =~ "<small>small</small> words!"
  end

  test "expands hr tags" do
    str1 = "Stuf over the line\n---"
    str2 = "Stuf over the line\n***"
    str3 = "Stuf over the line\n- - -"
    str4 = "Stuf over the line\n*   *   *"
    str5 = "Stuf over the line"

    Enum.map([str1, str2, str3, str4], &(
      assert AlchemistMarkdown.hrs(&1) == "Stuf over the line\n<hr />"
    ))

    assert AlchemistMarkdown.hrs(str5) == str5
  end
end
