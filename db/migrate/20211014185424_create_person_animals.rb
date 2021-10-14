class CreatePersonAnimals < ActiveRecord::Migration[7.0]
  def change
    create_table :person_animals do |t|
      t.integer :animal_id
      t.integer :person_id

      t.timestamps
    end
  end
end
