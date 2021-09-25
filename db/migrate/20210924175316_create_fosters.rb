class CreateFosters < ActiveRecord::Migration[7.0]
  def change
    create_table :fosters do |t|
      t.string :full_name, null: false
      t.string :nick_name
      t.string :email, null: false
      t.boolean :is_home_during_day, null: false
      t.string :street, null: false
      t.string :apt
      t.string :phone, null: false
      
      t.timestamps
    end
  end
end
