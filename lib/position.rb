class Position
  attr_accessor :x_cord, :y_cord

  def initialize(x_cord, y_cord)
    @x_cord = x_cord
    @y_cord = y_cord
  end

  def coordinates
    [@x_cord, @y_cord]
  end
end
