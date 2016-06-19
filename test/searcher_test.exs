defmodule SearcherTest do
  use ExUnit.Case
  doctest Searcher

  test "can match documents" do
    index1 = Intake.parse_document %{body: "a a content test", id: 1}
    index2 = Intake.parse_document %{body: "a b test", id: 2}
    new_index = Intake.merge_indexes(index1, index2)
    phrase = "test"
    results = Searcher.search(new_index, phrase)
    assert results == [%{"test" => [%{cnt: 1, id: 2}, %{cnt: 1, id: 1}]}]
  end
end
