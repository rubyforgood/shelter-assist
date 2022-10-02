# frozen_string_literal: true

class PersonHome < ApplicationRecord
  belongs_to :person
  belongs_to :home
end
