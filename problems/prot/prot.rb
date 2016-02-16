class ProteinString
  include RosalindInOut

  attr_reader :rna_string, :amino_code

  def initialize(source)
    @rna_string = source.is_a?(String) ? import_line(source) : source.first
    @amino_code = transcribe
  end

  def to_s
    "#{amino_code}"
  end

private

  def transcribe
    rna_string.gsub(/.../) do |substr|
      case substr
      when 'AUG' then 'M'
      when /^AU/ then 'I'
      when /UU(U|C)/ then 'F'
      when /^(U|C)U/ then 'L'
      when /AG(U|C)/ then 'S'
      when /^(C|A)G/ then 'R'
      when /UGG/ then 'W'
      when /UA(U|C)/ then 'Y'
      when /UG(U|C)/ then 'C'
      when /(UAG)|(UGA)|(UAA)/ then ''
      when /CA(U|C)/ then 'H'
      when /^CA/ then 'Q'
      when /AA(U|C)/ then 'N'
      when /^AA/ then 'K'
      when /GA(U|C)/ then 'D'
      when /^GA/ then 'E'
      when /^GC/ then 'A'
      when /^GG/ then 'G'
      when /^CC/ then 'P'
      when /^AC/ then 'T'
      when /^UC/ then 'S'
      when /^GU/ then 'V'
      else "(%s)" % substr
      end
    end
  end

end
