defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.split(~r{[^a-zA-Z0-9ö\-]}, trim: true)
    |> Enum.map(&(String.downcase/1))
    |> Enum.frequencies()
  end
end
