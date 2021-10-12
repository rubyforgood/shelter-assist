class RenameFostersToPeople < ActiveRecord::Migration[7.0]
  def change
    rename_table :fosters, :people
    rename_table :foster_homes, :person_homes
  end
end
