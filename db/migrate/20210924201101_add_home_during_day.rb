class AddHomeDuringDay < ActiveRecord::Migration[7.0]
  def change
    add_column :fosters, :is_home_during_day, :boolean
  end
end
