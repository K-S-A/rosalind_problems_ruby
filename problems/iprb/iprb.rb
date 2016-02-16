class MateProbability
  include RosalindInOut

  attr_reader :dominant, :hetero, :recessive, :probability

  def initialize(source)
    @dominant, @hetero, @recessive = source.is_a?(String) ? import_line(source).split.map(&:to_i) : source
    @probability = calc_probability
  end

  def to_s
    "%.5f" % probability
  end

private

  def calc_probability
    total = dominant + hetero + recessive
    1 - (recessive*(recessive-1) + hetero*(0.25*(hetero-1)+recessive))/total/(total-1)
  end

end
