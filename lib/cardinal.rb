class Cardinal
  class << self
    def position(direction)
      case direction
      when "N"
        Direction::North.new
      when "S"
        Direction::South.new
      when "E"
        Direction::East.new
      when "W"
        Direction::West.new
      end
    end
  end
end
