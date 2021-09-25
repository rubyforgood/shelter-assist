require "test_helper"

class SignupsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post signup_url, params: { foster: { email: "hi@hi.com", phone: '571-412-8473' } }
    
    assert_response :success
  end

  test "should get new" do
    get new_signup_url
    assert_response :success
  end
end
