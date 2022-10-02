# frozen_string_literal: true

class AnimalAgePreference < ApplicationRecord
  belongs_to :person

  enum animal_value: {
    'Newborn (up to 3 months)' => 1,
    'Young (3 months - 2 years)' => 2,
    'Adult (2 - 5 years)' => 3,
    'Senior (5 years + )' => 4
  }
end
