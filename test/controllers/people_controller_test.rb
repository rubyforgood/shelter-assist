require "test_helper"

class PeopleControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @person = people(:one)
    sign_in(@person, scope: :admin)
  end

  test "should get index" do
    get people_url
    assert_response :success
  end

  test "should get new" do
    get new_person_url
    assert_response :success
  end

  test "should create person" do
    assert_difference("Person.count") do
      post people_url, params: { 
        person: { 
          full_name: 'Chuck Norris',
          email: "hi@hi.com",
          phone: '5714128473',
          is_home_during_day: true,
          transportation: "car",
          available_from: Time.local(2022, 7, 8),
        } 
      }
    end

    assert_redirected_to person_url(Person.last)
  end

  test "should show person" do
    get person_url(@person)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_url(@person)
    assert_response :success
  end

  test "should update person" do
    patch person_url(@person), params: {
      person: { 
        full_name: 'Chuck Norris',
        email: "hi@hi.com",
        phone: '5714128473',
        is_home_during_day: true, 
        transportation: Person.transportations(),
        available_from: Time.local(2022, 7, 8),
      }
    }
    assert_redirected_to person_url(@person)
  end

  test "should destroy person and associated person_homes" do
    assert_difference("Person.count", -1) do
      delete person_url(@person)
    end

    assert_redirected_to people_url
  end
end
