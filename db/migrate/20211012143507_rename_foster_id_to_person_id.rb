# frozen_string_literal: true

class RenameFosterIdToPersonId < ActiveRecord::Migration[7.0]
  def change
    rename_column :person_homes, :foster_id, :person_id
  end
end
