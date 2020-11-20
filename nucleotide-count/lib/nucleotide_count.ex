defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    Enum.count(strand, fn (x) -> x == nucleotide end)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    base_histogram = [?A, ?T, ?C, ?G]
    Map.new(base_histogram, &{&1, count(strand, &1)})
  end

  # histogram version 2
  # def histogram(strand) do
  #   base_histogram = %{?A => 0, ?T => 0, ?C => 0, ?G => 0}
  #   base_histogram |> Map.merge(Enum.frequencies(strand))
  # end
end
