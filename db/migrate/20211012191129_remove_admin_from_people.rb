class RemoveAdminFromPeople < ActiveRecord::Migration[7.0]
  def change
    remove_column :people, :admin, :boolean
  end
end
