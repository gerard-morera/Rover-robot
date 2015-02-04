class Parser

  # [ 8, 6 ] Integers
  def board_size
    initial_data[0] =~ /\A(\d+)x(\d+)/
    [ $1.to_i, $2.to_i ]
  end

  def holes
    initial_data[0] =~ /holes:(.*)\z/
    extract_points_from $1
  end

  # [ 2, 3 ]
  def initial_position
    initial_data[1] =~ /\A\((\d+,\d+)\)\z/
    extract_points_from( $1 ).first
  end

  # [ :up, :left, :left, :left, :left, :down, :down, ... ]
  def route
    initial_data[2].split( /\s*,\s*/ ).map &:to_sym 
  end


private

  def extract_points_from string
     string.scan( /(\d),(\d)/ ).map do |x, y| 
      Point.new( x.to_i, y.to_i ) 
    end
  end

  def initial_data
    @initial_data ||= File.readlines( 'problem' ).map do |line|
      line[0..-2]
    end
  end

end