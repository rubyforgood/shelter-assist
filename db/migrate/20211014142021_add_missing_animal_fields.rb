class AddMissingAnimalFields < ActiveRecord::Migration[7.0]
  def change
    add_column :animals, :breed, :string
    add_column :animals, :weight, :float
    add_column :animals, :sterilized, :boolean, default: false
    add_column :animals, :microchipped, :boolean, default: false
  end
end
