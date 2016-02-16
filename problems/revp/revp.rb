class ReversePalindrome
  include RosalindInOut

  attr_reader :dna_string, :positions, :min_len, :max_len

  def initialize(source, min_len = 4, max_len = 12)
    @dna_string = source.is_a?(String) ? import_lines(source).values.last : source.first
    @min_len, @max_len = min_len, max_len
    @positions = find_positions
  end

  def to_s
    "#{stringify(positions)}"
  end

private

  def find_positions
    (0..dna_string.length-min_len).each.with_object([]) do |i, arr|
      (min_len..[max_len, dna_string.length-i].min).reject(&:odd?).each do |n|
        substring = dna_string[i..i+n-1]
        arr << [i+1, substring.length] if rev_complement?(substring)
      end
    end
  end

  def rev_complement?(str)
    str[0..str.length/2-1] == ReverseComplement.new([str[str.length/2..-1]]).rev_string
  end

end
