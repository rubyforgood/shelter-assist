# frozen_string_literal: true

require 'test_helper'

class AnimalApplicationTest < ActiveSupport::TestCase
  test 'valid application' do
    app = AnimalApplication.new(inspiration: 'Passionate dog lover', start_date: Date.new)

    assert app.valid?
  end
end
