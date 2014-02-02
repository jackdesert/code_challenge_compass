class DrawingUtensil

  SEARCH_CHAR = '#'
  LINE_CHAR = '*'

  attr_reader :first_index, :last_index

  def initialize
    @first_index = nil
    @last_index = nil
  end

  def print_line(line)
    index_present = check_line_for_indexes(line)
    if outside
      # no changes
    elsif inside and index_present
      # no changes
    elsif inside and not index_present
      line[first_index] = LINE_CHAR
    elsif bottom
      num_chars = last_index - first_index
      line[first_index..last_index - 1] = LINE_CHAR * num_chars
      reset_indexes
    end
    puts line
  end

  private

  def check_line_for_indexes(line)
    index = line.index SEARCH_CHAR
    update_indexes(index) if index
    index
  end

  def update_indexes(index)
    if outside
      @first_index = index
    elsif inside
      @last_index = index
    end
  end

  def reset_indexes
    @first_index = @last_index = nil
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


pencil = DrawingUtensil.new
input_file = ARGV.pop

File.open(input_file).each do |line|
  pencil.print_line(line)
end

