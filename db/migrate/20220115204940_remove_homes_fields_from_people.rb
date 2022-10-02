# frozen_string_literal: true

class RemoveHomesFieldsFromPeople < ActiveRecord::Migration[7.0]
  def up
    remove_column :people, :street
    remove_column :people, :apt
  end

  def down
    add_column :people, :street, :string, null: false, default: 'Unkown'
    add_column :people, :apt, :string
  end
end
