require 'matrix'
class Field

  RESPONSE_VALUES = {empty: ["empty","empty","empty","occupied","empty","empty","empty","empty","empty"],
                     occupied: ["empty","empty","occupied","occupied","empty","empty","empty","empty","empty"]}

  def initialize(the_grid, high, width)
     @the_grid = the_grid
     @high = high
     @width = width
  end

  def grid
    @the_grid
  end

  def evaluate_space(pos_y, pos_x)
    @the_grid.send(:[]=,pos_y,pos_x,RESPONSE_VALUES[@the_grid[pos_y, pos_x].to_sym][neighboring_cells(pos_y, pos_x)]) 
  end

  def neighboring_cells(pos_y, pos_x)
    spaces = neighboring_spaces(pos_y, pos_x)
    spaces.delete_if{|val| val[0]<0 || val[1]<0}
    spaces.inject(0){|sum, pair| @the_grid[pair[0], pair[1]].nil? ? sum + 0 : (@the_grid[pair[0], pair[1]] == "occupied" ? sum + 1 : sum + 0) }
  end
  
  def neighboring_spaces(pos_y, pos_x)
    array = Array.new
    array << [pos_y-1, pos_x-1]
    array << [pos_y-1, pos_x]
    array << [pos_y-1, pos_x+1]
    array << [pos_y+1, pos_x-1]
    array << [pos_y, pos_x-1]
    array << [pos_y+1, pos_x]
    array << [pos_y+1, pos_x+1]
    array << [pos_y, pos_x+1]
    array
  end
end
