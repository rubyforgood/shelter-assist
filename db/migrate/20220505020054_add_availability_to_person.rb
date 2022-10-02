# frozen_string_literal: true

class AddAvailabilityToPerson < ActiveRecord::Migration[7.0]
  def change
    add_column :people, :available_from, :datetime
    add_column :people, :available_to, :datetime, null: true
  end
end
