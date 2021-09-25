class Foster < ApplicationRecord
  validates :street, presence: true
  validates :phone, phone: true
  validates :phone, format: { with: /\A\d+\z/, message: "Numbers only, please." }
end
