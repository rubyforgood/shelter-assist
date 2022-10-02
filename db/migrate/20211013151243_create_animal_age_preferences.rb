# frozen_string_literal: true

class CreateAnimalAgePreferences < ActiveRecord::Migration[7.0]
  def change
    create_table :animal_age_preferences do |t|
      t.references :person, null: false, foreign_key: true
      t.integer :animal_value

      t.timestamps
    end
  end
end
