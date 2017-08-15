RSpec.describe Building do
  context "Initialize" do
    it "should not initialize without proper argument" do
      expect { Building.new }.to raise_error(ArgumentError)
    end

    it "should not initialize with an invalid argument" do
      expect { Building.new("s","s") }.to raise_exception(Error::InvalidArgument)
    end

    it "should not initialize with zero value" do
      expect { Building.new(0,0) }.to raise_exception(Error::InvalidArgument)
    end

    it "should initialze building with given integer x y coordinates" do
      building = Building.new(5,5)
      expect(building.grid.size).to eq(5)
    end
  end

  context "Access Cell" do
    let (:building) { Building.new(2,2) }
    let (:grid) { [["a","b"],["c","d"]] }

    it "should get any cell with given location" do
      allow(building).to receive(:get_cell).and_return(grid[1][0])
      expect(building.get_cell(1,0)).to eq("c")
    end
  end

  context "Access Cell color" do
    let (:building) { Building.new(2,2) }

    it "should get any cell color with given location" do
      expect(building.get_cell_color(1,0)).to eq("E")
    end
  end

  context "Place Robot" do
    let (:building) { Building.new(2,2) }

    it "should validate robots position is inside valid boundary" do
      robot = Robot.new(0,0,"N","R")
      expect{ building.place(robot) }.to raise_exception(Error::InvalidArgument)
    end

    it "should place robot if the position is valid" do
      robot = Robot.new(0,1,"S","G")
      building.place(robot)
      expect(robot.position.coordinates).to eq([0,1])
    end
  end
end
