class Space < ActiveRecord::Base
 belongs_to :field
 attr_accessible :state, :pos_x, :pos_y

end
