class ReadFrame
  include RosalindInOut

  attr_reader :dna_string, :prot_strings

  def initialize(source)
    @dna_string = source.is_a?(String) ? import_lines(source).values.first : source.first
    @prot_strings = find_strings
  end

  def to_s
  "#{prot_strings}"
  end

private

  def find_strings
    # rna_str = RnaTranscriber.new([dna_string]).rna_string
    # str1 = rna_str.gsub(/.../){|s| s =~ /(UAG)|(UGA)|(UAA)/ ? '___' : s}
    # prt = ProteinString.new([str1])
    # p prt.amino_code
    # strgs = str1.split(/_|M/)
    # p 'Strings'
    # strgs.each do |st|
    #   p ProteinString.new([st]).amino_code
    # end
    # a = ProteinString.new([str1])
    # p rna_str
    # p str1
    # p a.amino_code
    # p strgs
  end

end

# "AGCCAUGUAGCUAACUCAGGUUACAUGGGGAUGACCCCGCGACUUGGAUUAGAGUCUCUUUUGGAAUAAGCCUGAAUGAUCCGAGUAGCAUCUCAG"
# "AGCCAUGUAGCUAACUCAGGUUACAUGGGGAUGACCCCGCGACUUGGAUUAGAGUCUCUUUUGGAA+++GCC+++AUGAUCCGAGUAGCAUCUCAG"
# "SHVANSGYMGMTPRLGLESLLE(+++)A(+++)MIRVASQ"
#                                                                           M
#                     MGMTPRLGLESLLE
#                           MTPRLGLESLLE
# MLLGSFRLIPKETLIQVAGSSPCNLS
