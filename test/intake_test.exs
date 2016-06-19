defmodule IntakeTest do
  use ExUnit.Case
  doctest Intake

  test "can parse document" do
    document = %{body: "a a content", id: 1}
    res = Intake.parse_document(document)
    assert res == %{"a" => [%{cnt: 2, id: 1}], "content" => [%{cnt: 1, id: 1}]}
  end

  test "can merge indexes" do
    index1 = Intake.parse_document %{body: "a a content", id: 1}
    index2 = Intake.parse_document %{body: "a b test", id: 2}
    new_index = Intake.merge_indexes(index1, index2)
    assert new_index == %{"a" => [%{cnt: 1, id: 2}, %{cnt: 2, id: 1}], "b" => [%{cnt: 1, id: 2}],
  "content" => [%{cnt: 1, id: 1}], "test" => [%{cnt: 1, id: 2}]}
  end
end
