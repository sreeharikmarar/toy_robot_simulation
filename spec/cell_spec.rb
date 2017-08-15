RSpec.describe Cell do
  context "Initialize" do
    it "should initialze with empty value" do
      cell = Cell.new
      expect(cell.color.value).to eq("E")
    end
  end

  context "Fill color" do
    it "should change the cell color to given color" do
      cell = Cell.new
      cell.fill_color("R")
      expect(cell.color.value).to eq("R")
    end
  end

  context "Additive Color" do
    it "should become yellow if red is applied to green" do
      cell = Cell.new
      cell.fill_color("R")
      cell.fill_color("G")
      expect(cell.color.value).to eq("Y")
    end

    it "should become yellow if green is applied to red" do
      cell = Cell.new
      cell.fill_color("G")
      cell.fill_color("R")
      expect(cell.color.value).to eq("Y")
    end
  end

  context "Undefined color" do
    it "should become empty if any undefined color is given" do
      cell = Cell.new
      cell.fill_color("R")
      cell.fill_color("G")
      cell.fill_color("S")
      expect(cell.color.value).to eq("E")
    end
  end
end
