class Home < ApplicationRecord
  has_many :person_homes
  has_many :people, through: :person_homes
end
