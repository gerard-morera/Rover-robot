require_relative 'point'
require_relative 'parser'
require_relative 'board'
require_relative 'base_rover'
require_relative 'rover'
require_relative 'fast_rover'
require_relative 'printer'



class Application

  def run
    print_and_sleep 1.5

    route.each do |next_step|
      rover.go next_step
 
      print_and_sleep 1.0
    end

    rover.position
  end

private

  def print_and_sleep time
    printer.print
    sleep time
  end

  def route
    parser.route
  end

  def rover
    @rover ||= FastRover.new board, parser.initial_position 
  end

  def board
    @board ||= Board.new *parser.board_size, parser.holes 
  end

  def parser
    @parser ||= Parser.new 
  end

  def printer
    @printer ||= Printer.new board, rover
  end

end
