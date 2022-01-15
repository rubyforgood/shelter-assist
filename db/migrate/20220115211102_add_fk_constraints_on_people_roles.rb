class AddFkConstraintsOnPeopleRoles < ActiveRecord::Migration[7.0]
  def up
    add_foreign_key :people_roles, :people
    add_foreign_key :people_roles, :roles
  end

  def down
    remove_foreign_key :people_roles, :people
    remove_foreign_key :people_roles, :roles
  end
end
