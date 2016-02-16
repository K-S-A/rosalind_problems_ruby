class ReverseComplement
  include RosalindInOut

  attr_reader :dna_string, :rev_string

  def initialize(source)
    @dna_string = source.is_a?(String) ? import_line(source) : source.first
    @rev_string = dna_strand
  end

  def to_s
    "#{rev_string}"
  end

private

  def dna_strand
    dna_string.reverse.gsub(/./) do |chr|
      case chr
      when 'A' then 'T'
      when 'T' then 'A'
      when 'C' then 'G'
      when 'G' then 'C'
      end
    end
  end

end
