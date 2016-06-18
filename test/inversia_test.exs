defmodule InversiaTest do
  use ExUnit.Case
  doctest Inversia

  test "parse content" do
    document = %{body: "here is some test content for test", id: 1}
    documents = [document]
    split = String.split(document[:body], " ", trim: true)
    word_map = split |> Enum.map(fn word ->
      %{document_ids: [document[:id]], word: word}
    end
    )
  end
end
