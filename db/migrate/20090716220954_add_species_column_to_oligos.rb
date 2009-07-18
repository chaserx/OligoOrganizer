class AddSpeciesColumnToOligos < ActiveRecord::Migration
  def self.up
    add_column :oligos, :species, :string
  end

  def self.down
    remove_column :oligos, :species
  end
end
