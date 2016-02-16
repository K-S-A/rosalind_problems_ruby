class RnaSplice
  include RosalindInOut

  attr_reader :dna_string, :dna_strings, :protein

  def initialize(source)
    lines = source.is_a?(String) ? import_lines(source).values : source
    @dna_string, @dna_strings = lines.shift, lines
    @protein = trans_prot
  end

  def to_s
  "#{protein}"
  end

private

  def trans_prot
    string = dna_string.dup
    dna_strings.each { |str| string.sub!(str, '') }
    ProteinString.new([RnaTranscriber.new([string]).rna_string]).amino_code
  end

end
