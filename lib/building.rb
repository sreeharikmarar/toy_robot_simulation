class Building
  attr_accessor :grid, :robot, :max_x, :max_y

  class << self
    def create(args)
      x , y = validate_args(args)
      Building.new(x,y)
    end
  end

  def initialize(x, y)
    @max_x , @max_y = validate(x, y)
    @grid = initialize_grid(@max_x, @max_y)
  end

  def place(robot)
    raise Error::InvalidArgument.new("robots position should be inside (#{@max_x},#{@max_y}) bounday") unless placable?(robot)
    robot.building = self
  end

  def get_cell(x,y)
    @grid[y][x]
  end

  def get_cell_color(x,y)
    get_cell(x,y).color.value
  end

  def state
    @grid.reverse.each do |panels|
      panels.each do |cell|
        print cell.color.value
      end
      puts
    end
  end

  private

  def initialize_grid(x,y)
    Array.new(y) { Array.new(x) { Cell.new } }
  end

  def placable?(robot)
    x_cord, y_cord = robot.position.coordinates
    ((0...@max_x) === x_cord && (0...@max_y) === y_cord)
  end

  def validate(x,y)
    self.class.validate(x,y)
  end

  def self.validate_args(args)
    raise Error::InvalidArgument.new("invalid arguments! should be 2") unless args.split.length == 2
    x, y = args.scan(/-?\w+/)
    validate(x,y)
  end

  def self.validate(x, y)
    raise Error::InvalidArgument.new("raw and cloumn values are missing") unless x && y
    x = Integer(x) rescue (raise Error::InvalidArgument.new("raw value should be an integer"))
    y = Integer(y) rescue (raise Error::InvalidArgument.new("column value should be an integer"))
    raise Error::InvalidArgument.new("raw and column values should be greater than zero") unless x > 0 && y > 0
    [x, y]
  end
end
