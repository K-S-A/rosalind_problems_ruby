class DnaConsensus
  include RosalindInOut

  DNA_BASES = %w(A C G T)

  attr_reader :dna_strings, :consensus, :profile

  def initialize(source)
    @dna_strings = (source.is_a?(String) ? import_lines(source) : source.first).values
    @profile = build_profile
    @consensus = build_consensus
  end

  def to_s
    "#{consensus.join}\n#{stringify(profile)}"
  end

private

  def build_profile
    prof = DNA_BASES.map{|b| [b, []]}.to_h
    dna_strings.map(&:chars).transpose.each.with_object(prof) do |arr, hsh|
      hsh.merge!(hashed(arr)){ |_, oldval, newval| oldval << newval }
    end
  end

  def hashed(arr)
    hsh = arr.group_by{|c| c}.map{ |k,v| [k, v.size] }.to_h
    (DNA_BASES - hsh.keys).each { |b| hsh[b] = 0 }
    hsh
  end

  def build_consensus
    dna_strings.first.length.times.with_object([]) do |index, arr|
      arr << profile.max_by{|_, list| list[index]}.first
    end
  end

end
