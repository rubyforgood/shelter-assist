class Animal < ApplicationRecord
  has_many :person_animals
  has_many :people, through: :person_animals
end
