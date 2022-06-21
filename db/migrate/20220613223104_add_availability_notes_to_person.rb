class AddAvailabilityNotesToPerson < ActiveRecord::Migration[7.0]
  def change
    add_column :people, :availability_notes, :string, null: true
  end
end
