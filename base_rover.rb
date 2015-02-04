class BaseRover

  attr_reader :board, :position
  
  def initialize board, position
    @board    = board
    @position = position
  end

  def go direction
    speed.times { advance direction }
  end

  def speed
    raise NotImplementedError, "All BaseRover subclasses must define its #speed"
  end

  def self.speed speed
    define_method( :speed ) { speed }
  end

private

  attr_writer :position

  def advance direction
    next_position = position.move direction

    if board.valid? next_position
      self.position = next_position
    end
  end

end

