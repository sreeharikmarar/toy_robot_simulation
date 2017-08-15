class Robot
  DIRECTIONS = %W( N n W w S s E e)
  COLORS = %W(R r G g Y y)

  include Commands

  attr_accessor :building, :position, :direction
  attr_reader :color

  class << self
    def create(args)
      x, y, direction, color = validate_args(args)
      Robot.new(x,y,direction,color)
    end
  end

  def initialize(x_cord, y_cord, direction, color)
    x_cord, y_cord, direction, color = validate(x_cord, y_cord, direction, color)
    @color = color
    @position = Position.new(x_cord, y_cord)
    @direction = Cardinal.position(direction)
  end

  def execute(command)
    commands = parse_commands(command)
    commands.each { |cmd|
      cmd = cmd.strip.upcase
      raise Error::InvalidCommand.new("invalid command! eg: FLRI") unless Commands.public_method_defined?(cmd)
      send(cmd)
    }
  end

  def direction
    @direction.value
  end

  private

  def self.validate_args(args)
    raise Error::InvalidArgument.new("invalid argument, Sample: 0 0 N R") unless args.split.length == 4
    x, y, direction, color = args.scan(/-?\w+/)
    validate(x, y, direction, color)
  end

  def self.validate(x, y, direction, color)
    raise Error::InvalidArgument.new("raw and cloumn values are missing") unless x && y
    x = Integer(x) rescue (raise Error::InvalidArgument.new("invalid x position! should be integer"))
    y = Integer(y) rescue (raise Error::InvalidArgument.new("invalid y position! should be integer"))
    raise Error::InvalidArgument.new("invalid direction! eg: N W S E") unless DIRECTIONS.include?(direction)
    raise Error::InvalidArgument.new("invalid color! eg: R G") unless COLORS.include?(color)
    [x, y , direction.upcase, color.upcase]
  end

  def validate(x,y,direction,color)
    self.class.validate(x,y,direction,color)
  end
end
