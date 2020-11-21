defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text |> String.to_charlist |> Enum.map(&(rotate_char(&1, shift))) |> List.to_string
  end

  def rotate_char(char, shift) do
    rotated_char = char + shift
    cond do
      char in ?a..?z and rotated_char > ?z -> rotate_char(char, shift - 26)
      char in ?A..?Z and rotated_char > ?Z -> rotate_char(char, shift - 26)
      char in ?A..?z -> rotated_char
      true -> char
    end
  end
end
