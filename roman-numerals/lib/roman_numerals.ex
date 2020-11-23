defmodule RomanNumerals do
  @to_romans [
    {1000, "M"},
    {900, "CM"},
    {500,  "D"},
    {400, "CD"},
    {100,  "C"},
    {90,  "XC"},
    {50,   "L"},
    {40,  "XL"},
    {10,   "X"},
    {9,   "IX"},
    {5,    "V"},
    {4,   "IV"},
    {1,    "I"}
  ]

  def numeral(0), do: ""

  def numeral(number) do
    {range, roman} = Enum.find(@to_romans, fn {x, _} ->
      number >= x
    end)

    roman <> numeral(number - range)
  end
end
