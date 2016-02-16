class LexicographicEnum
  include RosalindInOut

  attr_reader :alphabet, :word_size, :dictionary

  def initialize(source)
    lines = source.is_a?(String) ? import_lines(source).flatten : source
    @alphabet, @word_size = get_collection(lines[0].split), lines[1].to_i
    @dictionary = generate_dictionary
  end

  def to_s
  "#{dictionary.join("\n")}"
  end

private

  def generate_dictionary(size = word_size, set = alphabet)
    (set.keys*size).combination(size).to_a.uniq.sort.map do |s|
      s.join.gsub(/./, set)
    end
  end

  def get_collection(arr)
    arr.map.with_index{|l, i| [(i+97).chr, l]}.to_h
  end

end
