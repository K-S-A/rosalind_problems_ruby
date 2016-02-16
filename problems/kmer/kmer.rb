class KmerComposition < LexicographicEnum
  attr_reader :dna_string, :composition

  def initialize(source)
    @dna_string = source.is_a?(String) ? import_lines(source).values.last : source
    @alphabet = get_collection(dna_string.chars.uniq.sort)
    @word_size = alphabet.size
    @dictionary = generate_dictionary
    @composition = calc_composition
  end

  def to_s
  "#{composition.values.join(" ")}"
  end

private

  def calc_composition
    hsh = Hash[dictionary.map{|a| [a, 0]}]
    (dna_string.size - word_size + 1).times.with_object(hsh) do |i, obj|
      obj[dna_string[i..i+3]] += 1
    end
  end

end
