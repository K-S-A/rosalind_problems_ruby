class ExpOffspring
  include RosalindInOut

  attr_reader :profile, :average, :offspring_num, :couples_vars

  def initialize(source, offspring_num = 2, couples_vars = [1, 1, 1, 0.75, 0.5, 0])
    @profile = source.is_a?(String) ? import_line(source).split.map(&:to_i) : source.first
    @offspring_num, @couples_vars = offspring_num, couples_vars
    @average = calc_offspring
  end

  def to_s
    "#{average}"
  end

private

  def calc_offspring
    profile.zip(couples_vars).map do |prof, coupl|
      prof * coupl * offspring_num
    end.inject(&:+)
  end

end
