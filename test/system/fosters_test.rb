require "application_system_test_case"

class FostersTest < ApplicationSystemTestCase
  test "signing up" do
    visit new_signup_url

    assert_selector "h1", text: "Sign Up"
    assert_selector "label", text: "Email"

    fill_in "Email", with: "peter@github.com"
    fill_in "Street", with: "123 Sesame Street"
    fill_in "Apt", with: "Unit A"
    click_on "Fetch!"

    assert_selector "h1", text: "Woof."
  end
end
