defmodule PigLatin do
  @vowels ["a", "e", "i", "o", "u"]

  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> Enum.map(&(translate_word/1))
    |> Enum.join(" ")
  end

  defp translate_word(word) do
    <<_ , rest::bytes>> = word
    first = String.first(word)
    second = String.at(word, 1)
    last = String.last(word)

    cond do
      first == "u" and last == "q" -> translate(rest <> first)
      first == "x" and is_consonant(second) -> word <> "ay"
      first == "y" and is_consonant(second) -> word <> "ay"
      is_vocal(first) -> word <> "ay"
      true -> translate(rest <> first)
    end
  end

  defp is_vocal(char) do
    Enum.member?(@vowels, char)
  end

  defp is_consonant(char) do
    !Enum.member?(@vowels, char)
  end

end
