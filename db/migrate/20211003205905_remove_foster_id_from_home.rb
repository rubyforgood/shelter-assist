# frozen_string_literal: true

class RemoveFosterIdFromHome < ActiveRecord::Migration[7.0]
  def change
    remove_index :homes, :foster_id
    remove_column :homes, :foster_id, :string
  end
end
