require "application_system_test_case"

class FostersTest < ApplicationSystemTestCase
  test "signing up" do
    visit new_signup_url

    assert_selector "h1", text: "Sign Up"
    assert_selector "label", text: "Email"
    assert_selector "label", text: "Phone"
    assert_selector "h2", text: "HOME INFORMATION"
    assert_selector "h3", text: "Are you or another adult home during the day?"
    assert_selector "h3", text: "Transportation"

    fill_in "Full name", with: "Cookie Monster"
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

    choose "is_home_during_day_true"
    select "No car", from: "Can you drive?"

    click_on "Fetch!"
    
    assert_selector "p", text: "Check your email for a login link" # change to personal status page

    mail = ActionMailer::Base.deliveries.last
    body = Nokogiri::HTML(mail.body.raw_source)

    assert_equal "peter@github.com", mail.to.first
    assert_match /your login link/, body.to_s
  end
end
