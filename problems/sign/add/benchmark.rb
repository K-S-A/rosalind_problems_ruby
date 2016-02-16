    require 'benchmark'

    REP_NUM = 1

  def build_permutations(base)
    ([*-base..base] - [0]).permutation(base).reject do |v|
      v.map(&:abs).uniq!
    end
  end

  def build_permutations1(base)
    arr = []
    ([*-base..base] - [0]).permutation(base) do |pr|
      arr << pr unless pr.map(&:abs).uniq!
    end
    arr
  end


    Benchmark.bm do |x|
      x.report('build_permutations') { REP_NUM.times { build_permutations(6) } }
      x.report('build_permutations1') { REP_NUM.times { build_permutations1(6) } }
    end

