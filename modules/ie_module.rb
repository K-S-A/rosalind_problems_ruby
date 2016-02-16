module RosalindInOut

  def export_to_file(name, dir = nil)
    dir ||= "problems/#{name}/"
    file = "#{dir}/result_#{name}.txt"
    File.open(file, 'w') do |f|
      [self.to_s].each{ |val| f << "%s" % val }
    end
  end

private

  def stringify(obj)
    if obj.is_a?(Hash)
    then obj.map{|k,v| "#{k}: #{v.join(' ')}"}
    else obj.map{|e| e.join(' ')}
    end.join("\n")
  end

  def import_line(name)
    File.open(get_filename(name), &:readline).strip
  end

  def import_lines(name)
    File.foreach(get_filename(name)).with_object({}) do |line, hsh|
      line = line.strip.sub(/^>/, '')
      $' || hsh.empty? ? hsh[line] = '' : hsh[hsh.keys.last] << line
    end
  end

  def import_array(name)
    File.foreach(get_filename(name)).with_object([]) do |line, arr|
      arr << line.strip
    end
  end

  def get_filename(name)
    "problems/#{name}/rosalind_#{name}.txt"
  end

end
