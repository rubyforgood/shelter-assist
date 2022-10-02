# frozen_string_literal: true

json.array! @animal_applications, partial: 'animal_applications/animal_application', as: :animal_application
