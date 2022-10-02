# frozen_string_literal: true

require 'test_helper'
require 'passwordless_test_helper'

class StatusControllerTest < ActionDispatch::IntegrationTest
  include PasswordlessTestHelper

  test 'should get show' do
    person = people(:one)
    sign_in(person, scope: :person)
    get person_root_url
    assert_response :success
  end
end
