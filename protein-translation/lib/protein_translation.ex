defmodule ProteinTranslation do
  @codon_to_protein %{
  "UGU" => "Cysteine",
  "UGC" => "Cysteine",
  "UUA" => "Leucine",
  "UUG" => "Leucine",
  "AUG" => "Methionine",
  "UUU" => "Phenylalanine",
  "UUC" => "Phenylalanine",
  "UCU" => "Serine",
  "UCC" => "Serine",
  "UCA" => "Serine",
  "UCG" => "Serine",
  "UGG" => "Tryptophan",
  "UAU" => "Tyrosine",
  "UAC" => "Tyrosine",
  "UAA" => "STOP",
  "UAG" => "STOP",
  "UGA" => "STOP"
  }

  def of_rna(rna) do
    try do
      codons = for codon <- rna_to_codons(rna), do: codon_to_protein(codon)
      {:ok, codons}
    rescue
      _ -> {:error, "invalid RNA"}
    end
  end

  def rna_to_codons(rna) do
    rna
    |> String.to_charlist()
    |> Enum.chunk_every(3)
    |> Enum.map(&(to_string/1))
    |> Enum.take_while(fn codon -> codon_to_protein(codon) != "STOP" end)
  end

  def of_codon(codon) do
    try do
      {:ok, codon_to_protein(codon)}
    rescue
      _ -> {:error, "invalid codon"}
    end
  end

  defp codon_to_protein(codon) do
    Map.fetch!(@codon_to_protein, codon)
  end
end
