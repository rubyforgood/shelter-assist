class Person < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  passwordless_with :email

  enum transportation: [ :access_to_car, :car, :no_car ]

  has_many :animal_kind_preferences
  has_many :animal_gender_preferences
  has_many :animal_age_preferences
  has_many :animal_size_preferences

  accepts_nested_attributes_for :animal_kind_preferences, reject_if: proc { |attributes| attributes["animal_value"].blank? }
  accepts_nested_attributes_for :animal_gender_preferences, reject_if: proc { |attributes| attributes["animal_value"].blank? }
  accepts_nested_attributes_for :animal_age_preferences, reject_if: proc { |attributes| attributes["animal_value"].blank? }
  accepts_nested_attributes_for :animal_size_preferences, reject_if: proc { |attributes| attributes["animal_value"].blank? }

  has_many :person_homes, inverse_of: :person
  has_many :homes, through: :person_homes
  accepts_nested_attributes_for :homes

  validates :full_name, presence: true
  validates :street, presence: true
  validates :is_home_during_day, presence: true
  validates :transportation, presence: true
  validates :phone, format: { with: /\A\d+\z/, message: "Numbers only, please." }

  before_validation :prep_phone
  after_create :assign_default_role

  def prep_phone
    self.phone = self.phone.to_s.gsub(/[^0-9A-Za-z]/, '')
  end

  def self.fetch_resource_for_passwordless(email)
    find_by(email: email)
  end

  def password_required?
    false
  end

private

  def assign_default_role
    self.add_role(:foster) if self.roles.blank?
  end
end
