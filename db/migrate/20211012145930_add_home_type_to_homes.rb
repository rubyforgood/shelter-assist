class AddHomeTypeToHomes < ActiveRecord::Migration[7.0]
  def change
    add_column :homes, :home_type, :integer
  end
end
