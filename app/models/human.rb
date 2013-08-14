require './inputvalidator'

class Human
  attr_reader :icon

  def initialize(icon)
    @icon = icon
  end

  def choose_next_move(board_string)
    $stdin.gets.to_i
  end
end

