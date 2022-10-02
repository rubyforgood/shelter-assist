# frozen_string_literal: true

class Dog < ApplicationRecord
  validates :name, presence: true
end
