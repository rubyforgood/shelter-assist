require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase
  setup do
    @home = homes(:one)
  end

  test "visiting the index" do
    visit homes_url
    assert_selector "h1", text: "Home"
  end

  test "should create Home" do
    visit homes_url
    click_on "New Home"

    click_on "Create Home"

    assert_text "Home was successfully created"
    click_on "Back"
  end
end
