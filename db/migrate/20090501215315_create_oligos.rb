class CreateOligos < ActiveRecord::Migration
  def self.up
    create_table :oligos do |t|
      t.integer :user_id
      t.string :name
      t.string :sequence
      t.text :description
      t.text :notes
      t.integer :length
      t.float :gcpercentage
      t.float :tm
      t.string :freezer
      t.string :box
      t.timestamps
    end
  end
  
  def self.down
    drop_table :oligos
  end
end
