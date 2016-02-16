class DnaContent
  include RosalindInOut

  attr_reader :set, :max_gc

  def initialize(source)
    @set = source.is_a?(String) ? import_lines(source) : source
    @max_gc = calc_max_gc
  end

  def to_s
    "%s\n%.6f" % [max_gc[0], max_gc[1]]
  end

private

    def calc_gc(str)
      str.count('CG') * 100.0 / str.length
    end

  def calc_max_gc
    set.map{ |k,v| [k, calc_gc(v)] }.max_by{ |_, v| v }
  end

end
