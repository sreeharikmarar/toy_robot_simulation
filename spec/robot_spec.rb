RSpec.describe Robot do
  # context "Initialize" do
  #   it "should not initialze with an invalid argument" do
  #     expect { Robot.new }.to raise_error(ArgumentError)
  #   end

  #   it "should not initialze with an invalid co-ordinates" do
  #     expect { Robot.new("s","s","N", "R") }.to raise_error(Error::InvalidArgument)
  #   end

  #    it "should not initialze with an invalid direction" do
  #     expect { Robot.new(0,0,"V","R") }.to raise_error(Error::InvalidArgument)
  #   end

  #   it "should not initialze with an invalid color" do
  #     expect { Robot.new(0,0,"N","Z") }.to raise_error(Error::InvalidArgument)
  #   end

  #   it "should initialze robot with valid argument" do
  #     building = Building.new(5,5)
  #     robot = Robot.new(0, 2,"N", "R")
  #     building.place(robot)
  #     expect(robot.position.coordinates).to eq([0,2])
  #     expect(robot.direction).to eq("North")
  #     expect(robot.color).to eq("R")
  #   end
  # end

  # context "Move Forward" do
  #   let (:building) { Building.new(5,5) }

  #   it "should move forward based on the direction" do
  #     robot = Robot.new(0, 2,"N", "R")
  #     building.place(robot)
  #     robot.execute("F")
  #     expect(robot.position.coordinates).to eq([0,3])
  #   end

  #   it "should fill a color after moving forward" do
  #     robot = Robot.new(0, 2,"N", "R")
  #     building.place(robot)
  #     robot.execute("F")
  #     robot.execute("I")
  #     expect(robot.position.coordinates).to eq([0,3])
  #     expect(building.get_cell_color(robot.position.x_cord,robot.position.y_cord)).to eq("R")
  #   end
  # end

  # context "Move out of boundary" do
  #   it "should not move if the next position is out of boundary" do
  #     building = Building.new(2,2)
  #     robot = Robot.new(0, 1,"N", "R")
  #     building.place(robot)
  #     expect { robot.execute("F") }.to raise_exception(Error::InvalidPosition)
  #   end
  # end

  # context "Move Left" do
  #   let (:building) { Building.new(5,5) }

  #   it "should move left from north and set the direction" do
  #     robot = Robot.new(0, 2, "N","R")
  #     building.place(robot)
  #     robot.execute("L")
  #     expect(robot.direction).to eq("West")
  #   end

  #   it "should move left from west and set the direction" do
  #     robot = Robot.new(2, 1, "W","R")
  #     building.place(robot)
  #     robot.execute("L")
  #     expect(robot.direction).to eq("South")
  #   end

  #   it "should move left from east and set the direction" do
  #     robot = Robot.new(2, 1, "E","R")
  #     building.place(robot)
  #     robot.execute("L")
  #     expect(robot.direction).to eq("North")
  #   end

  #   it "should move left from south and set the direction" do
  #     robot = Robot.new(2, 1, "S","R")
  #     building.place(robot)
  #     robot.execute("L")
  #     expect(robot.direction).to eq("East")
  #   end
  # end

  # context "Move Right" do
  #   let (:building) { Building.new(5,5) }

  #   it "should move right from north and set the direction" do
  #     robot = Robot.new(0, 2, "N","R")
  #     building.place(robot)
  #     robot.execute("R")
  #     expect(robot.direction).to eq("East")
  #   end

  #   it "should move right from west and set the direction" do
  #     robot = Robot.new(2, 1, "W","R")
  #     building.place(robot)
  #     robot.execute("R")
  #     expect(robot.direction).to eq("North")
  #   end

  #   it "should move right from east and set the direction" do
  #     robot = Robot.new(2, 1, "E","R")
  #     building.place(robot)
  #     robot.execute("R")
  #     expect(robot.direction).to eq("South")
  #   end

  #   it "should move right from south and set the direction" do
  #     robot = Robot.new(2, 1, "S","R")
  #     building.place(robot)
  #     robot.execute("R")
  #     expect(robot.direction).to eq("West")
  #   end
  # end

  context "Obstucle in path" do 
    let (:building) { Building.new(5,5) }
    let(:cell) { Cell.new(true)}
    let(:cell_2) { Cell.new}
    let(:cell_3) { Cell.new}
    let(:cell_4) { Cell.new}
    let (:grid) { [[cell_2,cell_3],[cell,cell_4]] }


    it "should throw an exception if the cell has obstucle properties set in" do
      allow(building).to receive(:get_cell).and_return(grid[1][0])
      robot = Robot.new(0, 0, "N","R")
      building.place(robot)
      expect { robot.execute("F") }.to raise_error(Error::InvalidCellException)
    end

    it "should not throw an exception if the cell doenst has obstucle properties set in" do
      allow(building).to receive(:get_cell).and_return(grid[0][0])
      robot = Robot.new(0, 0, "N","R")
      building.place(robot)
      expect { robot.execute("F") }.not_to raise_error(Error::InvalidCellException)
    end
  end 
end
