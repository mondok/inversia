defmodule SearchHelper do
  def tokenize(nil), do: []
  def tokenize(phrase), do: String.split(phrase, " ", trim: true) |> Enum.map(&String.downcase/1) 
end
