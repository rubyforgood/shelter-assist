require "test_helper"

class FostersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @foster = fosters(:one)
  end

  test "should get index" do
    get fosters_url
    assert_response :success
  end

  test "should get new" do
    get new_foster_url
    assert_response :success
  end

  test "should create foster" do
    assert_difference("Foster.count") do
      post fosters_url, params: { foster: { email: "hi@hi.com", phone: '5714128473', street: 'Yo', apt: 'unit A', is_home_during_day: true } }
    end

    assert_redirected_to foster_url(Foster.last)
  end

  test "should show foster" do
    get foster_url(@foster)
    assert_response :success
  end

  test "should get edit" do
    get edit_foster_url(@foster)
    assert_response :success
  end

  test "should update foster" do
    patch foster_url(@foster), params: { foster: { email: "hi@hi.com", phone: '5714128473', street: 'Yo', apt: 'unit A', is_home_during_day: true } }
    assert_redirected_to foster_url(@foster)
  end

  test "should destroy foster" do
    assert_difference("Foster.count", -1) do
      delete foster_url(@foster)
    end

    assert_redirected_to fosters_url
  end
end
