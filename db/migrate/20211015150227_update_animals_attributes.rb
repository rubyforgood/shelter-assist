# frozen_string_literal: true

class UpdateAnimalsAttributes < ActiveRecord::Migration[7.0]
  def up
    remove_column :animals, :size
    remove_column :animals, :age
    remove_column :animals, :person_id
    remove_column :animals, :rescue_id
    add_column :animals, :birthdate, :date
  end

  def down
    add_column :animals, :size, :string
    add_column :animals, :age, :string
    add_column :animals, :person_id, :bigint
    add_column :animals, :rescue_id, :bigint
  end
end
