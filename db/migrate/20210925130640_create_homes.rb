# frozen_string_literal: true

class CreateHomes < ActiveRecord::Migration[7.0]
  def change
    create_table :homes do |t|
      t.boolean  :has_children, default: false
      t.boolean  :has_fenced_yard, default: false
      t.boolean  :has_other_adults, default: false
      t.boolean  :has_other_dog, default: false
      t.boolean  :has_other_cat, default: false

      t.timestamps
    end
  end
end
