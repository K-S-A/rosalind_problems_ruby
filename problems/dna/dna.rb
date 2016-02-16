class DnaContent
  include RosalindInOut

  attr_reader :dna_string, :content

  def initialize(source)
    @dna_string = source.is_a?(String) ? import_line(source) : source.first
    @content = calc_content
  end

  def to_s
  "#{content.join(' ')}"
  end

private

  def calc_content
    dna_string.unpack("c*").group_by{|i| i}.values.sort.map(&:size)
  end

end
