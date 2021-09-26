class Foster < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  passwordless_with :email
  
  enum transportation: [ :access_to_car, :car, :no_car ]

  validates :full_name, presence: true
  validates :street, presence: true
  validates :is_home_during_day, presence: true
  validates :transportation, presence: true
  validates :phone, phone: true
  validates :phone, format: { with: /\A\d+\z/, message: "Numbers only, please." }

  before_validation :prep_phone

  def prep_phone
    self.phone = self.phone.to_s.gsub(/[^0-9A-Za-z]/, '')
  end

  def self.fetch_resource_for_passwordless(email)
    find_by(email: email)
  end

  def password_required?
    false
  end
end
