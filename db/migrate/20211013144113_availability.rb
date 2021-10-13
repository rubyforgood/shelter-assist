class Availability < ActiveRecord::Migration[7.0]
  def change
    add_column :people, :from, :date
  end
end
