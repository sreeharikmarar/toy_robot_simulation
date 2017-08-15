module Color
  class Empty
    attr_reader :value

    def initialize
      @value = "E"
    end

    def change(color)
      case color
      when "R"
        Color::Red.new
      when "G"
        Color::Green.new
      else 
        Color::Empty.new
      end
    end
  end

  class Red < Color::Empty
    def initialize
      @value = "R"
    end

    def change(color)
      case color
      when "G"
        Color::Yellow.new
      when "R"
        Color::Red.new
      else
        Color::Empty.new
      end
    end
  end

  class Green < Color::Empty
    def initialize
      @value = "G"
    end

    def change(color)
      case color
      when "R"
        Color::Yellow.new
      else
        Color::Empty.new
      end
    end
  end

  class Yellow < Color::Empty
    def initialize
      @value = "Y"
    end

    def change(color)
      case color
      when "R"
        Color::Red.new
      when "G"
        Color::Green.new
      else
        Color::Empty.new
      end
    end
  end
end
