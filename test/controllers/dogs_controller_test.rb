# frozen_string_literal: true

require 'test_helper'

class DogsControllerTest < ActionController::TestCase
  test 'should get index with proper content' do
    get :index

    assert_response :success
    assert_not_nil assigns(:dogs)
    assert_includes @response.body, 'Fosterable Dogs'
    assert_includes @response.body,
                    'Thinking about fostering? These adorable dogs from local rescues need someone to foster them while they await their furever home. Click on a dog below to see more information about each dog.'
  end
end
