class HouseholdExtraInfo < ActiveRecord::Migration[7.0]
  def change
    add_column :people, :extra_availability_info, :text
  end
end
