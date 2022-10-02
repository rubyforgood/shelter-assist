# frozen_string_literal: true

class AddAddressFieldsToHomes < ActiveRecord::Migration[7.0]
  def change
    add_column :homes, :street, :string
    add_column :homes, :apt, :string
    add_column :homes, :state, :string
    add_column :homes, :city, :string
    add_column :homes, :zip_code, :string
  end
end
