class CreateDogs < ActiveRecord::Migration[7.0]
  def change
    create_table :dogs do |t|
      t.string :name, null: false
      t.string :gender, null: false
      t.date :birthdate, null: false
      t.float :weight, null: false
      t.string :size, null: false
      t.string :activity_needs, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
