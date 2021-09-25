require "application_system_test_case"

class FostersTest < ApplicationSystemTestCase
  test "signing up" do
    visit new_signup_url

    assert_selector "h1", text: "Sign Up"
    assert_selector "label", text: "Email"
    assert_selector "label", text: "Phone"
    assert_selector "h2", text: "HOME INFORMATION"
    assert_selector "label", text: "Are you or another adult home during the day?"

    fill_in "Email", with: "peter@github.com"
    fill_in "Street", with: "123 Sesame Street"
    fill_in "Apt", with: "Unit A"
    fill_in "Phone", with: "401-791-7482"
    
    check("Fenced Yard")
    check("Kids")
    assert_checked_field("Fenced Yard")
    assert_checked_field("Kids")
    
    assert_selector "h4", text: "Tell us things we might want to know about your home and your experience with pets."
    fill_in "inspiration", with: "I am the perfect foster"

    click_on "Fetch!"

    assert_selector "h1", text: "Woof."
  end
end
