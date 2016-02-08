require 'matrix'
require 'spec_helper'

describe Field do 
  before do 
    the_grid = Matrix[["empty", "empty", "occupied", "occupied"],
                      ["occupied", "occupied", "empty", "occupied"],
                      ["occupied", "empty", "empty", "empty"],
                      ["occupied", "occupied", "occupied", "occupied"]]
    @field = Field.new(the_grid, 4, 4)             
  end
  describe "#evaluate_space" do
    context "the space is empty" do
      context "the space is sorrounded by 2 neighboring cells" do 
        it "should continue empty" do 
          @field.evaluate_space(0, 0)
          expect(@field.grid[0, 0]).to eq "empty" 
        end
      end
      context "the space is sorrounded by 3 neighboring cells" do
        it "should change to be occupied" do
          @field.evaluate_space(0, 1)
          expect(@field.grid[0, 1]).to eq "occupied"
        end
      end
      context "the space is sorrounded by more than 3 neighboring cells" do 
        it "should continue empty" do 
          @field.evaluate_space(1, 2)
          expect(@field.grid[1, 2]).to eq "empty" 
        end
      end
    end
    context "the space is occupied" do 
      context "the space is sorrounded by just one neighboring cell" do 
        it "should change to be empty" do 
          @field.evaluate_space(3, 3)
          expect(@field.grid[3, 3]).to eq "empty" 
        end
      end
      context "the space is sorrounded by 2 neighboring cells" do 
        it "should continue occupied" do 
          @field.evaluate_space(2, 3)
          expect(@field.grid[2, 3]).to eq "occupied" 
        end
      end
      context "the space is sorrounded by 3 neighboring cells" do 
        it "should continue occupied" do 
          @field.evaluate_space(1, 3)
          expect(@field.grid[1, 3]).to eq "occupied" 
        end
      end
      context "the space is sorrounded by more than 3 neighboring cells" do 
        it "should change to be empty" do 
          @field.evaluate_space(2, 0)
          expect(@field.grid[2, 0]).to eq "empty" 
        end
      end
    end
  end
end
