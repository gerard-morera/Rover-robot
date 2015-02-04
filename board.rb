class Board

  attr_reader :size_x, :size_y, :holes

  def initialize size_x, size_y, holes
    @size_x = size_x
    @size_y = size_y
    @holes  = holes
  end

  def valid? position
    is_in_board? position and not is_a_hole? position
  end

private

  def is_a_hole? position
    holes.include? position
  end

  def is_in_board? position
    ( 1..size_x ).cover? position.x and ( 1..size_y ).cover? position.y
  end

end