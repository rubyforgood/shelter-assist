require "test_helper"

class HomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @home = homes(:one)
  end

  test "should get index" do
    get homes_url
    assert_response :success
  end

  test "should get new" do
    get new_home_url
    assert_response :success
  end

  test "should show home" do
    get home_url(@home)
    assert_response :success
  end

  test "should get edit" do
    get edit_home_url(@home)
    assert_response :success
  end

  test "should update home" do
    patch home_url(@home), params: { home: { home_type: "House" } }
    assert_redirected_to home_url(@home)
  end

  test "should destroy home and associated person_homes" do
    assert_difference("Home.count", -1) do
      delete home_url(@home)
    end

    assert_redirected_to homes_url
  end
end
