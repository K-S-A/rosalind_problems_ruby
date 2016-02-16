class NumSequence
  include RosalindInOut

  attr_reader :n, :k, :last

  def initialize(source)
    @n, @k = source.is_a?(String) ? import_line(source).split.map(&:to_i) : source
    @last = seq_number
  end

  def to_s
    "#{last}"
  end

private

  def seq_number
    a = [1,1]
    (n-2).times do
      a << (a[-2]*k + a[-1])
    end
    a.last
  end

end
