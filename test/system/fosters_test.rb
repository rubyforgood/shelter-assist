require "application_system_test_case"

class FostersTest < ApplicationSystemTestCase
  test "signing up" do
    visit new_signup_url

    assert_selector "h1", text: "Sign Up"
    assert_selector "label", text: "Email"

    fill_in "Email", with: "peter@github.com"

    assert_selector "h2", text: "HOME INFORMATION"
    assert_selector "label", text: "Are you or another adult home during the day?"

    click_on "Fetch!"

    assert_selector "h1", text: "Woof."
  end
end
