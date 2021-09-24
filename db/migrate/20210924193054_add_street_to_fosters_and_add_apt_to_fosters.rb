class AddStreetToFostersAndAddAptToFosters < ActiveRecord::Migration[7.0]
  def change
    add_column :fosters, :street, :string
    add_column :fosters, :apt, :string
  end
end
