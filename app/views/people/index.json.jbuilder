# frozen_string_literal: true

json.array! @people, partial: 'people/person', as: :person
