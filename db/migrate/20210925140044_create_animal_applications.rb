# frozen_string_literal: true

class CreateAnimalApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :animal_applications do |t|
      t.text      :inspiration, null: false
      t.datetime  :start_date, null: false
      t.datetime  :end_date

      t.timestamps
    end
  end
end
