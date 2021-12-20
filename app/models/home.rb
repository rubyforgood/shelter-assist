class Home < ApplicationRecord
  has_many :person_homes, inverse_of: :home
  has_many :people, through: :person_homes

  enum home_type: {
    "Apartment/Condo" => 1,
    "Townhouse" => 2,
    "House" => 3,
  }

  validates :home_type, presence: true
end
