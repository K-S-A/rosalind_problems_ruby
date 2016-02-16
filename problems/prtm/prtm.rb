class ProtStringMass
  include RosalindInOut

  ACID_MASS = {
    A: 71.03711,
    C: 103.00919,
    D: 115.02694,
    E: 129.04259,
    F: 147.06841,
    G: 57.02146,
    H: 137.05891,
    I: 113.08406,
    K: 128.09496,
    L: 113.08406,
    M: 131.04049,
    N: 114.04293,
    P: 97.05276,
    Q: 128.05858,
    R: 156.10111,
    S: 87.03203,
    T: 101.04768,
    V: 99.06841,
    W: 186.07931,
    Y: 163.06333}

  attr_reader :prot_string, :weight

  def initialize(source)
    @prot_string = source.is_a?(String) ? import_line(source) : source.first
    @weight = calc_weight
  end

  def to_s
  "%.3f" % weight
  end

private

  def calc_weight
    prot_string.chars.inject(0){|mass, a| mass += ACID_MASS[a.to_sym]}
  end

end
