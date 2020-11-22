defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split(~r{[^[:alpha:][:alnum:]ö\-]}, trim: true) # Equivalent to ~r{[^a-zA-Z0-9ö\-]}, trim: true
    |> Enum.frequencies()
  end
end
