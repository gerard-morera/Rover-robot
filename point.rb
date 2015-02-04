# p = Point.new 3,4
# p.move :up # => #<Point: x:3, y:3>


class Point

  DIRECTIONS = { 
    :up    =>  [ 0,-1 ],
    :down  =>  [ 0, 1 ],
    :left  =>  [-1, 0 ],
    :right =>  [ 1, 0 ]
  }

  attr_reader :x, :y

  def initialize x, y
    @x = x
    @y = y
  end

  def move direction 
    dx, dy = DIRECTIONS[ direction ]

    Point.new x + dx, y + dy
  end

  def == other
    x == other.x and y == other.y
  end

end