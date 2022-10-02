# frozen_string_literal: true

require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @person = people(:one)
    sign_in(@person, scope: :admin)
  end

  test 'should get index' do
    get people_url
    assert_response :success
  end

  test 'should get new' do
    get new_person_url
    assert_response :success
  end

  test 'should create person' do
    assert_difference('Person.count') do
      post people_url, params: {
        person: {
          full_name: 'Chuck Norris',
          email: 'hi@hi.com',
          phone: '5714128473',
          is_home_during_day: true,
          transportation: 'car',
          available_from: 5.days.from_now,
          available_to: 7.days.from_now,
          availability_notes: 'I cannot do the first week of next month because I am on vacation.'
        }
      }
    end

    assert_redirected_to person_url(Person.last)
  end

  test 'should show person' do
    get person_url(@person)
    assert_response :success
  end

  test 'should get edit' do
    get edit_person_url(@person)
    assert_response :success
  end

  test 'should update person' do
    patch person_url(@person), params: {
      person: {
        full_name: 'Chuck Norris',
        email: 'hi@hi.com',
        phone: '5714128473',
        is_home_during_day: true,
        transportation: Person.transportations,
        available_from: 5.days.from_now,
        available_to: 7.days.from_now,
        availability_notes: 'I cannot do the first week of next month because I am on vacation.'
      }
    }
    assert_redirected_to person_url(@person)
  end

  test 'should destroy person and associated person_homes' do
    assert_difference('Person.count', -1) do
      delete person_url(@person)
    end

    assert_redirected_to people_url
  end
end
