class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.integer :high
      t.integer :width
    end
  end
end
