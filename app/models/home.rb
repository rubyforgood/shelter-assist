class Home < ApplicationRecord
  has_many :foster_homes
  has_many :fosters, through: :foster_homes
end
