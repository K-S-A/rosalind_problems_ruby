class SignedPermutation
  include RosalindInOut

  attr_reader :base, :permutations

  def initialize(source)
    @base = source.is_a?(String) ? import_line(source).to_i : source.first
    @permutations = build_permutations
  end

  def to_s
  "#{permutations.count}\n#{stringify(permutations)}"
  end

private

  def build_permutations
    ([*-base..base] - [0]).permutation(base).reject do |v|
      v.map(&:abs).uniq!
    end
  end

end
