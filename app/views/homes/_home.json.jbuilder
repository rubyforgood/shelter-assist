# frozen_string_literal: true

json.extract! home, :id, :created_at, :updated_at
json.url home_url(home, format: :json)
