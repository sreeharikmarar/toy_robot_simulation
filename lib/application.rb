class Application
  attr_accessor :building, :robot

  class << self
    def run(arg)
      begin
        validate(arg)
        process
        output
      rescue Exception => e
        puts "Exception => #{e.message}"
      end
    end

    def process
      @building = Building.create(ARGF.gets)
      
      while !ARGF.eof
        @robot = Robot.create(ARGF.gets)
        @building.place(@robot)
        @robot.execute(ARGF.gets)
      end
    end

    def output
      @building.state
    end

    private
    def validate(arg)
      raise Error::InvalidArgument.new("file argument is missing!") if arg.nil?
      raise Error::InvalidArgument.new("input file doesn't exist!") unless File.exists?(arg)
    end
  end
end
