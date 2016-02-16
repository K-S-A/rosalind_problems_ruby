class SharedMotif
  include RosalindInOut

  attr_reader :dna_strings, :lc_substring

  def initialize(source)
    @dna_strings = source.is_a?(String) ? import_lines(source).values : source
    @lc_substring = longest_common_substring
  end

  def to_s
  "#{lc_substring}"
  end

private

  def longest_common_substring
    min_str = dna_strings.min_by(&:size)
    min_str.length.downto(1).each do |i|
      (0).downto(i - min_str.length).each do |j|
        sub = min_str[j-i..j-1]
        return sub if dna_strings.all?{|s| s.include?(sub) }
      end
    end
  end

end
