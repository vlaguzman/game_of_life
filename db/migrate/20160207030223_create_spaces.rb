class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.belongs_to :field, index: true 

      t.string :state
      t.integer :pos_x
      t.integer :pos_y
    end
  end

end
