require "test_helper"

class SignupsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post signup_url
    assert_response :success
  end

  test "should get new" do
    get new_signup_url
    assert_response :success
  end
end
