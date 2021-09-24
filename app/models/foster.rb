class Foster < ApplicationRecord
  validates :is_home_during_day, presence: true
end
