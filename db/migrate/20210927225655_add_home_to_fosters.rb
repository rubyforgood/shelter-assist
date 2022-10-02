# frozen_string_literal: true

class AddHomeToFosters < ActiveRecord::Migration[7.0]
  def change
    add_reference :homes, :foster, null: false, foreign_key: true, default: {}
  end
end
