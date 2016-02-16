    require 'benchmark'

    REP_NUM = 10_000
    PATTERN = "TTATATCATTGGGACTGTCGGGTGCGCATGTCCCTCGAAGGTTGGAGTTGACCTCGATCCTACTCTACCGTAACTGGAGCTGAAACGTTTGAGCAGGCGGTAAACATGTCATTCTCTGATTACGATAGACCGTGTGATCACCCACACAAGCTGACCCCAATATGATATTCCGGCCGGTGTCGTCTCGAGGTTAAGGGGTTGCACTCGATGCAAAAACAACTCAGGTCCTATGCGGCGCCTTTCCGCCTACGGCTATACGAGTACAAAGGGTCACCGTTACGCGTTAACATCGTTATTACCGTCGTCAAATGGAAACGACACACAAGTCGACGTCGAGGAGTCACATGCGGAGTAGTAAGTTTTTTCCCACCCACCTGATAAAGTTTCCGCTTAAGCCAGATTCGTCCTTACCTTGAGCTCGCCTAGCCTTTTGCGGGACCCGGGTTATGACCGCCCCCCGTAGTCCGAGTACCACAGCGTCTGGTCCCTCCATTAGGGCACAACTGTATCCATAGCCCGAGATTGTAACTTGTATACGCGCTAGATATTACCACTCAAAACGGGAGTGAGATCTTTCCCATCTACGTACTAGGGATGGTCAAGGGGAAATTAGAACCAAAATCACGCGTCGCCTTCCACTCCTCCCCACTGAATGAATTCCGTGGTAGTAAATCTATCCGCGAAACGTAGCATATATGATAACGGAATACGTTTTCACGTTTGACTATGGGTTTCGTTCGCCGTGAACTGCGTTGCAATGGTACCCGATCCACGGTCAAGGTTTCCCTCGTCTGTCATGCTAGTGCAGAATATAGAACAGACAGGTCACCTAGCACATGTTACAAAGCCTG"

    def countACGT(str)
      list = [0,0,0,0]
      str.scan(/A|C|G|T/) do |sub|
        case sub
        when "A"
          list[0] += 1
        when "C"
          list[1] += 1
        when "G"
          list[2] += 1
        when "T"
          list[3] += 1
        end
      end
      return list
    end

    def countACGT_with_object(str)
      str.chars.each.with_object(Hash.new(0)) do |letter, hash|
        hash[letter] += 1
      end.sort.map(&:last)
    end

    def countACGT_scan(str)
      str.chars.sort.join.scan(/A+|C+|G+|T+/).map(&:length)
    end

    def countACGT_pack(str)
      str.unpack("c*").sort.pack("c*").scan(/A+|C+|G+|T+/).map(&:length)
    end

    def countACGT_group_by(str)
        str.chars.group_by(&:chr).sort.map{|k, v| v.size}
    end

    def count_unpack_group_by(str)
      str.unpack("c*").group_by{|i| i}.values.sort.map(&:size)
    end

    Benchmark.bm do |x|
      x.report('countACGT') { REP_NUM.times { countACGT(PATTERN) } }
      x.report('countACGT_with_object') { REP_NUM.times { countACGT_with_object(PATTERN) } }
      x.report('countACGT_scan') { REP_NUM.times { countACGT_scan(PATTERN) } }
      x.report('countACGT_pack') { REP_NUM.times { countACGT_pack(PATTERN) } }
      x.report('countACGT_group_by') { REP_NUM.times { countACGT_group_by(PATTERN) } }
      x.report('count_unpack_group_by') { REP_NUM.times { count_unpack_group_by(PATTERN) } }
    end

puts "#{countACGT(PATTERN)}"
puts "#{countACGT_with_object(PATTERN)}"
puts "#{countACGT_scan(PATTERN)}"
puts "#{countACGT_pack(PATTERN).join(' ')}"
puts "#{countACGT_group_by(PATTERN)}"
puts "#{count_mix(PATTERN)}"
