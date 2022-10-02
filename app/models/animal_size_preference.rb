# frozen_string_literal: true

class AnimalSizePreference < ApplicationRecord
  belongs_to :person

  enum animal_value: {
    'less than 20 lbs' => 1,
    '20 - 40 lbs' => 2,
    '40 - 60 lbs' => 3,
    '60 +' => 4
  }
end
