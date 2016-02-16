class AdjacencyList
  include RosalindInOut

  attr_reader :dna_collection, :edge_length, :directed_graph

  def initialize(source, edge_length = 3)
    @dna_collection = source.is_a?(String) ? import_lines(source) : source
    @edge_length = edge_length - 1
    @directed_graph = build_graph
  end

  def to_s
    "#{stringify(directed_graph)}"
  end

private

  def build_graph
    dna_collection.each.with_object([]) do |(name, str), graph|
      dna_collection.each do |n, s|
        graph << [name, n] if str.object_id != s.object_id && str =~ /#{s[0..edge_length]}$/
      end
    end
  end

end
