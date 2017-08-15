class Cell
  attr_accessor :color

  def initialize
    @color = Color::Empty.new
  end

  def fill_color(color)
    @color = @color.change(color)
  end
end
