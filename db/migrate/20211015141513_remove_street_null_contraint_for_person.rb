class RemoveStreetNullContraintForPerson < ActiveRecord::Migration[7.0]
  def change
    change_column_null :people, :street, true
  end
end
