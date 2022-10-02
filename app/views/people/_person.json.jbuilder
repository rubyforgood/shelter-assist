# frozen_string_literal: true

json.extract! person, :id, :created_at, :updated_at
json.url person_url(person, format: :json)
