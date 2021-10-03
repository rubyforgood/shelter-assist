class CreateFosterHomes < ActiveRecord::Migration[7.0]
  def change
    create_table :foster_homes do |t|
      t.references :foster, null: false, foreign_key: true
      t.references :home, null: false, foreign_key: true

      t.timestamps
    end
  end
end
