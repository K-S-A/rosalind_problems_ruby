require 'benchmark'

REP_NUM = 100
str = 'GCATACCTGCATACCGAGAGGTGCATACCCGCATACCGCGCATACCAGCATACCTAACGAGGGAAGCATACCCGTAGGCATACCTCGGCATACCTCTGCATACCACGTCAGAATCACGCGCATACCGAAGCATACCTTCGCATACCGCGCGCATACCCTGCGCATACCCTGCATACCGCATACCACCGCATACCTTAGCATACCCGTCTCCATTGCGGCATACCAGCATACCGCATACCGGCATACCGAGCCTCTTGGCATACCTGCATACCTGCATACCGCATACCGCATACCAAGCATACCCGCATACCTCAAAGCCCCGCATACCGGCATACCGCATACCAAGAGCATACCCAGGGCATACCGGCATACCCAGCATACCTTTCACCGTGGGCATACCTACTCCTTTGGCATACCCGCATACCGCAGCGCATACCAACCGTGGGCATACCAGGCATACCGCATACCAGCGATGAGAGCATACCCGGCATACCTTCTGCCGTTGCATACCTCGCATACCGCATACCTACTAGCGGCATACCAGCATACCATGCCCGCATACCGGCATACCGACCTGTGCATACCCTCGCATACCGCGCATACCCGATGCATACCACAGCATACCAAGTCAAATGCATACCCTTGAGCATACCGCATACCAGTGCATACCTGCATACCGTGCATACCTGCATACCTACGCATACCTCCGGCATACCGCATACCCATACCTTTGCATACCGTCTCCGCATACCAAGCATACCGCATACCAGTACGGCATACCTGCATACCAGCATACCAGCATACCCTGACTTTGGTCAGCATACCTAGCATACCGCATACCAGGCATACCTACGAAAATGCATACCCGCATACCGCATACCCCCGGCATACCCCGCATACCGCATACCGCATACCTGGCGCATACCAGCATACCATGGCATACCGCATACCGGAGGCATACCTGCATACCACGCATACCGCATACCCAGCATACC'
substr = 'GCATACCGC'


  def find_locations_1(string, substring)
    indexes = []
    current_index = -1
    while current_index = string.index("#{substring}", current_index + 1)
      indexes << (current_index+1)
    end
    indexes
  end

  def find_locations_2(string, substring)
    (0..(string.length - substring.length + 1)).map do |i|
      i + 1 if string[i..-1] =~ /^#{substring}/
    end.compact
  end



Benchmark.bm do |x|
  x.report('find_locations_1') { REP_NUM.times { find_locations_1(str, substr) } }
  x.report('find_locations_2') { REP_NUM.times { find_locations_2(str, substr) } }
end


