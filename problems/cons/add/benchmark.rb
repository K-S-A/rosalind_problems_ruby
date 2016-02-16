require 'benchmark'

REP_NUM = 100_000

matrix = [["A", "T", "C", "C", "A", "G", "C", "T"],
                 ["G", "G", "G", "C", "A", "A", "C", "T"],
                 ["A", "T", "G", "G", "A", "T", "C", "T"],
                 ["A", "A", "G", "C", "A", "A", "C", "C"],
                 ["T", "T", "G", "G", "A", "A", "C", "T"],
                 ["A", "T", "G", "C", "C", "A", "T", "T"],
                 ["A", "T", "G", "G", "C", "A", "C", "T"]]
# p matrix.transpose.map{|i| i.group_by{|c| c}.sort}.map{|a| a.map{|b| [b.first, b.last.size]}.to_h}
nucleotides = %w(A C G T)

strings = ["ATCCAGCT", "GGGCAACT", "ATGGATCT", "AAGCAACC", "TTGGAACT", "ATGCCATT", "ATGGCACT"]

prof = {'A' => [1, 5, 0, 0, 0, 1, 1, 6], 'C' => [0, 0, 1, 4, 2, 0, 6, 1], 'G' => [1, 1, 6, 3, 0, 1, 0, 0], 'T' => [1, 5, 0, 0, 0, 1, 1, 6]}
# prof.each_pair{|k,v| p k, v.split('').map(&:to_i)}
def consensus(m, nucl)
  m.transpose.map {|x| nucl.max_by {|n| x.count(n)}}
end
# p consensus #=> ["A", "T", "G", "C", "A", "A", "C", "T"]

def build_consensus(dna_strings, profile)
  dna_strings.first.length.times.with_object([]) do |index, arr|
    arr << profile.max_by{|_, list| list[index]}.first
  end
end


Benchmark.bm do |x|
  x.report('consensus') { REP_NUM.times { consensus(matrix, nucleotides) } }
  x.report('build_consensus') { REP_NUM.times { build_consensus(strings, prof) } }
end
