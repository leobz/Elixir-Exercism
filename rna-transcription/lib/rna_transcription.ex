defmodule RnaTranscription do
  @next_nucleotide %{?G => ?C, ?C => ?G, ?T => ?A, ?A => ?U}

  def to_rna(dna) do
    for x <- dna, do: next_nucleotide(x)
  end

  defp next_nucleotide(nucleotide) do
    Map.fetch!(@next_nucleotide, nucleotide)
  end
end
