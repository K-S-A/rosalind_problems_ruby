class DnaMotif
  include RosalindInOut

  attr_reader :substring, :string, :locations

  def initialize(source)
    @string, @substring = source.is_a?(String) ? import_lines(source).flatten : source
    @locations = find_locations
  end

  def to_s
    "%s" % locations.join(' ')
  end

private

  def find_locations
    indexes = []
    current_index = -1
    while current_index = string.index("#{substring}", current_index + 1)
      indexes << (current_index+1)
    end
    indexes
  end

end
