class SeqComparator
  include RosalindInOut

  attr_reader :seq1, :seq2, :distance

  def initialize(source)
    @seq1, @seq2 = source.is_a?(String) ? import_lines(source).flatten : source
    @distance = seq_distance
  end

  def to_s
    "#{distance}"
  end

private

  def seq_distance
    seq1.chars.each.with_index.inject(0) do |dist, (ch, index)|
      ch != seq2[index] ? dist + 1 : dist
    end
  end

end
