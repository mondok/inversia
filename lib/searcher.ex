defmodule Searcher do
  def search(index, phrase) do
    tokens = SearchHelper.tokenize(phrase)
    matches = index |> Map.keys |> Enum.filter(fn key ->
      tokens |> Enum.any?(fn tk -> tk == key end)
    end)
    retrieve_matches([], index, matches)
  end

  def retrieve_matches(acc, index, [head | tail]) do
    {:ok, match} = Map.fetch(index, head)
    retrieve_matches(acc ++ [%{head => match}], index, tail)
  end

  def retrieve_matches(acc, index, []) do
    acc
  end

end
