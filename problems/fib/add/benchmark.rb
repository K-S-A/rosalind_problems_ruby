    require 'benchmark'

    REP_NUM = 100_000


  def seq_num(n=34, k=3)
    a = b = 1
    (n-2).times do
      a, b = b, a*k + b
    end
    b
  end

  def seq_number(n=34, k=3)
    (3..n).each.with_object([1, 1]) do |i, arr|
      (arr << k*arr.first + arr.last).shift
    end.last
  end

  def seq_numb(n=34, k=3)
    a = [1,1]
    (n-2).times do
      a << (a[-2]*k + a[-1])
    end
    a.last
  end

    Benchmark.bm do |x|
      x.report('seq_num') { REP_NUM.times { seq_num } }
      x.report('seq_number') { REP_NUM.times { seq_number } }
      x.report('seq_numb') { REP_NUM.times { seq_numb } }
    end
