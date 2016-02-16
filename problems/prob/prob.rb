class DnaProb
  include RosalindInOut

  attr_reader :dna_string, :gc_probs, :log_probs

  def initialize(source)
    lines = source.is_a?(String) ? import_lines(source).flatten : source
    @gc_probs = lines.pop.split.map{|f| f.to_f / 2}
    @dna_string = lines.first
    @log_probs = match_log
  end

  def to_s
  "#{log_probs.map{|f| "%.3f" % f}.join(' ')}"
  end

private

  def match_log
    gc_probs.map do |f|
      dna_string.chars.inject(0) do |sum, ch|
        sum += Math.log10(ch =~ /C|G/ ? f : (0.5 - f))
      end
    end
  end

end
