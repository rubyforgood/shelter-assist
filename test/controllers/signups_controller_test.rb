# frozen_string_literal: true

require 'test_helper'

class SignupsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    post signup_url, params: {
      person: {
        full_name: 'Chuck Norris',
        email: 'hi@hi.com',
        phone: '571-412-8473',
        is_home_during_day: false,
        transportation: 'car'
      }
    }

    assert_response :success
  end

  test 'should get new' do
    get new_signup_url
    assert_response :success
  end
end
