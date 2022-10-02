# frozen_string_literal: true

class CreateRescues < ActiveRecord::Migration[7.0]
  def change
    create_table :rescues do |t|
      t.string :file_name
      t.string :email
      t.string :name
      t.string :phone_number

      t.timestamps
    end
  end
end
