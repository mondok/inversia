defmodule Intake do
  def merge_indexes(existing_docs, new_docs) do
    new_map = new_docs |> Map.keys |> Enum.map(fn k ->
      new = new_docs |> extract_doc_array(k)
      old = existing_docs |> extract_doc_array(k)

      full_list = [new, old] |> List.flatten

      %{k => full_list}
    end) |> to_hash

    Map.merge(existing_docs, new_map)
  end

  def extract_doc_array(map, key) do
    case map |> Map.fetch(key) do
      :error -> []
      {:ok, docs} -> docs
    end
  end

  def to_hash(list_of_hashes) do
    list_of_hashes |> Enum.reduce(%{}, &Enum.into/2)
  end

  def parse_document(document) do
    split = String.split(document[:body], " ", trim: true)
    split |> Enum.group_by(fn word -> word end)
          |> Enum.map(fn {word, values} ->
                %{word => [%{id: document[:id], cnt: Enum.count(values)}] }
              end
              ) |> to_hash
  end

end
