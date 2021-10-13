class AnimalKindPreference < ApplicationRecord
  belongs_to :person

  enum animal_value: { "Dog" => 1, "Cat" => 2 }
end
