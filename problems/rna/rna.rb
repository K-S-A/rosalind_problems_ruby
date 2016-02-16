class RnaTranscriber
  include RosalindInOut

  attr_reader :dna_string, :rna_string

  def initialize(source)
    @dna_string = source.is_a?(String) ? import_line(source) : source.first
    @rna_string = to_rna
  end

  def to_s
  "#{rna_string}"
  end

private

  def to_rna
    dna_string.gsub(/T/, 'U')
  end

end
