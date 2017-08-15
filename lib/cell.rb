class Cell
  attr_accessor :color, :has_obstucle

  def initialize(has_obstucle=false)
    @color = Color::Empty.new
    @has_obstucle = has_obstucle
  end

  def fill_color(color)
    @color = @color.change(color)
  end
end
