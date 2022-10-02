# frozen_string_literal: true

require 'test_helper'

class AnimalApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @animal_application = animal_applications(:one)
  end

  test 'should get index' do
    get animal_applications_url
    assert_response :success
  end

  test 'should get new' do
    get new_animal_application_url
    assert_response :success
  end

  test 'should create animal_application' do
    assert_difference('AnimalApplication.count') do
      post animal_applications_url, params: {
        animal_application: {
          start_date: Date.new,
          inspiration: 'foo'
        }
      }
    end

    assert_redirected_to animal_application_url(AnimalApplication.last)
  end

  test 'should show animal_application' do
    get animal_application_url(@animal_application)
    assert_response :success
  end

  test 'should get edit' do
    get edit_animal_application_url(@animal_application)
    assert_response :success
  end

  test 'should update animal_application' do
    patch animal_application_url(@animal_application), params: { animal_application: {} }
    assert_redirected_to animal_application_url(@animal_application)
  end

  test 'should destroy animal_application' do
    assert_difference('AnimalApplication.count', -1) do
      delete animal_application_url(@animal_application)
    end

    assert_redirected_to animal_applications_url
  end
end
