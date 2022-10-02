# frozen_string_literal: true

class PersonAnimal < ApplicationRecord
  belongs_to :person
  belongs_to :animal
end
