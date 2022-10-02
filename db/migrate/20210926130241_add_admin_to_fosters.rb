# frozen_string_literal: true

class AddAdminToFosters < ActiveRecord::Migration[7.0]
  def change
    add_column :fosters, :admin, :boolean, default: false, null: false
  end
end
