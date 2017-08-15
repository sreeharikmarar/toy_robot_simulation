module Commands
  def F
    move_forward
  end

  def L
    turn(@direction.left)
  end

  def R
    turn(@direction.right)
  end

  def I
    fill_color
  end

  private

  def move_forward
    raise Error::InvalidPosition.new("can't move further! invalid position") unless can_move?(next_position)
    raise Error::InvalidCellException.new("can't move further! blocking cell") if blocking_cell?(next_position)
    @position = next_position
  end

  def turn(direction)
    @direction = direction
  end

  def fill_color
    x_cord, y_cord = @position.coordinates
    @building.get_cell(x_cord,y_cord).fill_color(@color)
  end

  def next_position
    x_cord, y_cord = @position.coordinates
    case @direction.value
    when "North"
      Position.new(x_cord, y_cord + 1)
    when "South"
      Position.new(x_cord, y_cord - 1)
    when "East"
      Position.new(x_cord + 1, y_cord)
    when "West"
      Position.new(x_cord - 1, y_cord)
    end
  end

  def parse_commands(command)
    command.scan(/[a-zA-Z]/)
  end

  def can_move?(next_position)
    x, y = next_position.coordinates
    ((0...@building.max_x) === x && (0...@building.max_y) === y)
  end

  def blocking_cell?(next_position)
    x, y = next_position.coordinates
    @building.get_cell(x,y).has_obstucle
  end
end
