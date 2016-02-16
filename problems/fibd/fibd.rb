class FibMortSequence
  include RosalindInOut

  attr_reader :n, :m, :last

  def initialize(source)
    @n, @m = source.is_a?(String) ? import_line(source).split.map(&:to_i) : source
    @last = seq_number
  end

  def to_s
    "#{last}"
  end

private

  def seq_number
    (2..(n-1)).each.with_object([1, 1]) do |i, arr|
      arr << (arr[-2] + arr[-1] - (i < m ? 0 : (i > (m+1) ? arr[-m-1] : 1 )))
    end.last
  end

end
