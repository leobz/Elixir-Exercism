defmodule SecretHandshake do
  @codes [
    {8, "jump"},
    {4, "close your eyes"},
    {2, "double blink"},
    {1, "wink"}
  ]

  def commands(code) do
    do_comands(code) |> Enum.reverse()
  end

  defp do_comands(16) do [] end
  defp do_comands(0) do [] end
  defp do_comands(number) when number >= 16, do: do_comands(number - 16) |> Enum.reverse()

  defp do_comands(number) do
    {scale, code} = Enum.find(@codes, fn {x,_} -> number >= x end)

    case number - scale do
      0 -> [code]
      _ -> [code | do_comands(number - scale)]
    end
  end
end
