# frozen_string_literal: true

class FixTypesInPersonAnimalsTable < ActiveRecord::Migration[7.0]
  def up
    change_column :person_animals, :person_id, :bigint
    change_column :person_animals, :animal_id, :bigint

    add_foreign_key :person_animals, :people
    add_foreign_key :person_animals, :animals
  end

  def down
    remove_foreign_key :person_animals, :people
    remove_foreign_key :person_animals, :animals

    change_column :person_animals, :person_id, :integer
    change_column :person_animals, :animal_id, :integer
  end
end
