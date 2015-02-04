class Printer

  HORIZONTAL_BORDER = "="
  VERTICAL_BORDER   = "|"
  HOLE_CHARACTER    = "0"
  ROVER_CHARACTER   = "R"
  
  attr_reader :board, :rover

  def initialize board, rover
    @board = board
    @rover = rover
  end

  def print 
    map_with_rover = map.tap do |map_with_rover|
      map_with_rover[rover_position.y][rover_position.x] = ROVER_CHARACTER
    end

    puts map_with_rover
  end

private
  
  def map 
    holes.each_with_object base_map do |hole, map|
      map[hole.y][hole.x] = HOLE_CHARACTER
    end
  end
  
  def base_map
    [
      horizontal_limit,
      *normal_lines,
      horizontal_limit
    ]
  end

  def normal_lines
    board.size_y.times.map do 
      "#{ VERTICAL_BORDER }#{ ' ' * board.size_x }#{ VERTICAL_BORDER }" 
    end 
  end

  def horizontal_limit
    HORIZONTAL_BORDER * ( board.size_x + 2 )
  end

  def holes
    self.board.holes 
  end

  def rover_position
    rover.position
  end

end