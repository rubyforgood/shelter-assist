require "test_helper"
require "passwordless_test_helper"

class StatusControllerTest < ActionDispatch::IntegrationTest
  include PasswordlessTestHelper

  test "should get show" do
    foster = fosters(:one)
    sign_in(foster, scope: :foster)
    get foster_root_url
    assert_response :success
  end
end
