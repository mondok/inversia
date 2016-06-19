defmodule SearchHelperTest do
  use ExUnit.Case
  doctest SearchHelper

  test "can tokenize word" do
    word = "one two three"
    tokens = SearchHelper.tokenize(word)
    assert tokens == ["one", "two", "three"]
  end

  test "cannot tokenize nil" do
    word = nil
    tokens = SearchHelper.tokenize(word)
    assert tokens == []
  end

end
