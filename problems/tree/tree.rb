class GraphTree
  include RosalindInOut

  attr_reader :adjacency_list, :min_edges, :n

  def initialize(source)
    @n, *@adjacency_list = source.is_a?(String) ? mod_graph(import_array(source)) : source
    @n = n.last
    @min_edges = calc_edges
  end

  def to_s
  "#{min_edges}"
  end

private

  def calc_edges
    g_count = adjacency_list.each.with_object([]) do |a, arr|
      indx = arr.index{|x| x.include?(a.first) || x.include?(a.last) }
      indx ? arr[indx] += a : arr << a
    end.size
    n - adjacency_list.flatten.uniq.size - 1+ g_count
  end

  def mod_graph(arr)
    arr.map{|a| a.split.map(&:to_i) }
  end

end
