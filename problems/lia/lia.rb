class IndependentAllel
  include RosalindInOut

  attr_reader :k, :n, :probability

  def initialize(source)
    @k, @n = source.is_a?(String) ? import_line(source).split.map(&:to_i) : source
    @probability = calc_prob
  end

  def to_s
  "%.3f" % probability
  end

private

  def calc_prob
    total = 2**k
    (n..total).inject(0) do |sum, i|
      sum + (0.25**i)*(0.75**(total-i))*factorial(total) / factorial(total-i) / factorial(i)
    end
  end

  def factorial(n)
    (2..n).reduce(1, :*)
  end

end
