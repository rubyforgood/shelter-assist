class AnimalGenderPreference < ApplicationRecord
  belongs_to :person

  enum animal_value: { "Male" => 1, "Female" => 2 }
end
