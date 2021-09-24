class CreateFosters < ActiveRecord::Migration[7.0]
  def change
    create_table :fosters do |t|
      t.string :email, null: false
      
      t.timestamps
    end
  end
end
