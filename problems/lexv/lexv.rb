class VarLexEnum < LexicographicEnum

  def initialize(source)
    super
    @dictionary = generate_var_dictionary
  end

private

  def generate_var_dictionary
    generate_pattern.uniq.sort.map{|w| w.gsub(/./, alphabet)}
  end

  def generate_pattern(max_size = word_size, min_size = 1)
    (min_size..max_size).each.with_object([]) do |i, obj|
      obj << (alphabet.keys*i).combination(i).map(&:join)
    end.flatten
  end

end
