require_relative '../hamm/hamm'

class TransitionRatio < SeqComparator
  attr_reader :tt_ratio

  def initialize(source)
    @seq1, @seq2 = source.is_a?(String) ? import_lines(source).values : source
    @distance = seq_distance
    @tt_ratio = trans_ratio
  end

  def to_s
    "%.11f" % tt_ratio
  end

private

  def trans_ratio
    transitions = seq1.chars.each.with_index.inject(0) do |sum, (ch, i)|
      sum += (seq1[i] + seq2[i]) =~ /(AG)|(GA)|(CT)|(TC)/ ? 1 : 0
    end
    transitions.to_f / (distance - transitions)
  end

end
