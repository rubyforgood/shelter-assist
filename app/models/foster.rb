class Foster < ApplicationRecord
  enum transportation: [ :access_to_car, :car, :no_car ]

  validates :full_name, presence: true
  validates :street, presence: true
  validates :is_home_during_day, presence: true
  validates :transportation, presence: true
  validates :phone, phone: true
  validates :phone, format: { with: /\A\d+\z/, message: "Numbers only, please." }

  before_validation :prep_phone

  def prep_phone
    self.phone = self.phone.gsub(/[^0-9A-Za-z]/, '')
  end
end
