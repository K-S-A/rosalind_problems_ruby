class PermutationFinder
  include RosalindInOut

  attr_reader :number, :permutations

  def initialize(source)
    @number = source.is_a?(String) ? import_line(source).to_i : source.first
    @permutations = calc_permutations
  end

  def to_s
    "#{permutations.length}\n#{stringify(permutations)}"
  end

private

  def calc_permutations
    [*1..number].permutation.to_a
  end

end
