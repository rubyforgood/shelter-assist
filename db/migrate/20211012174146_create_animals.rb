class CreateAnimals < ActiveRecord::Migration[7.0]
  def change
    create_table :animals do |t|
      t.string :name, null: false
      t.string :animal_kind, null: false
      t.string :gender, null: false
      t.string :age, null: false
      t.string :size, null: false
      t.references :person, null: false, foreign_key: true
      t.references :rescue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
