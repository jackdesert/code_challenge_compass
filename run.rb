require 'pry'

input_file = ARGV.pop

class Draw
  SEARCH_CHAR = '#'
  LINE_CHAR = '*'

  attr_reader :first_index, :last_index

  def initialize
    @first_index = nil
    @last_index = nil
  end

  def print_line(line)
    check_line_for_indexes(line)
    if outside
      puts line
    elsif inside
      line[first_index] = LINE_CHAR
      puts line
    elsif bottom
      num_chars = last_index - first_index
      line[first_index..last_index] = LINE_CHAR * num_chars
      puts line
    end
  end

  private

  def check_line_for_indexes(line)
    index = line.index SEARCH_CHAR
    update_indexes(index) if index
  end

  def update_indexes(index)
    if outside
      @first_index = index
    elsif inside
      @last_index = index
    elsif bottom
      @first_index = @last_index = nil
    end
  end

  def outside
    first_index.nil? && last_index.nil?
  end

  def inside
    first_index && last_index.nil?
  end

  def bottom
    first_index && last_index
  end

end

pencil = Draw.new

File.open(input_file).each do |line|
  pencil.print_line(line)
end
