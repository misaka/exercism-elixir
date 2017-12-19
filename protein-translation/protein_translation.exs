defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  # def of_rna(rna) when Integer.mod(length(rna), 3) != 0 do
  #   {:error, "invalid codon"}
  # end

  def of_rna(rna) when is_bitstring(rna) do
    case of_rna(to_charlist(rna), []) do
      {:ok, reversed_proteins} -> {:ok, Enum.reverse(reversed_proteins)};
      {:error, message}        -> {:error, message}
    end
  end

  def of_rna([rna1, rna2, rna3 | tail], proteins) do
    case of_codon(to_string([rna1, rna2, rna3])) do
      {:ok, "STOP"}     -> {:ok, proteins};
      {:ok, codon}      -> of_rna(tail, [codon | proteins]);
      {:error, message} -> {:error, "invalid RNA"}
    end
  end

  def of_rna([], proteins) do
    {:ok, proteins}
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: { atom, String.t() }
  # def of_codon(codon) do
  # end
  def of_codon("UGU") do {:ok, "Cysteine"      } end
  def of_codon("UGC") do {:ok, "Cysteine"      } end
  def of_codon("UUA") do {:ok, "Leucine"       } end
  def of_codon("UUG") do {:ok, "Leucine"       } end
  def of_codon("AUG") do {:ok, "Methionine"    } end
  def of_codon("UUU") do {:ok, "Phenylalanine" } end
  def of_codon("UUC") do {:ok, "Phenylalanine" } end
  def of_codon("UCU") do {:ok, "Serine"        } end
  def of_codon("UCC") do {:ok, "Serine"        } end
  def of_codon("UCA") do {:ok, "Serine"        } end
  def of_codon("UCG") do {:ok, "Serine"        } end
  def of_codon("UGG") do {:ok, "Tryptophan"    } end
  def of_codon("UAU") do {:ok, "Tyrosine"      } end
  def of_codon("UAC") do {:ok, "Tyrosine"      } end
  def of_codon("UAA") do {:ok, "STOP"          } end
  def of_codon("UAG") do {:ok, "STOP"          } end
  def of_codon("UGA") do {:ok, "STOP"          } end
  def of_codon(_)     do {:error, "invalid codon" } end
end

