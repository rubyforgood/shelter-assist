# frozen_string_literal: true

json.extract! animal_application, :id, :created_at, :updated_at
json.url animal_application_url(animal_application, format: :json)
