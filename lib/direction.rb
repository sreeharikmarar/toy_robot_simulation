module Direction
  class East
    attr_reader :value
    def initialize
      @value = "East"
    end

    def left
      Direction::North.new
    end

    def right
      Direction::South.new
    end
  end

  class West
    attr_reader :value
    def initialize
      @value = "West"
    end

    def left
      Direction::South.new
    end

    def right
      Direction::North.new
    end
  end

  class North
    attr_reader :value
    def initialize
      @value = "North"
    end

    def left
      Direction::West.new
    end

    def right
      Direction::East.new
    end
  end

  class South
    attr_reader :value
    def initialize
      @value = "South"
    end

    def left
      Direction::East.new
    end

    def right
      Direction::West.new
    end
  end
end
