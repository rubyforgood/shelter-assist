require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  test "signing up" do
    visit new_signup_url

    assert_selector "h1", text: "Foster Application"
    assert_selector "label", text: "Email"
    assert_selector "label", text: "Phone"
    assert_selector "div", text: "Are you or another adult home during the day?"

    fill_in "Name", with: "Cookie Monster"
    fill_in "Email", with: "peter@github.com"
    fill_in "Street", with: "123 Sesame Street"
    fill_in "City", with: "Chicago"
    fill_in "State", with: "Illinois"
    fill_in "Zip", with: "12345"
    fill_in "Apartment", with: "Unit A"
    fill_in "Phone", with: "401-791-7482"

    # --- Capybara does not wait here!
    fenced_yard_checkbox = find("input[value='has_fenced_yard']", visible: false)
    fenced_yard_checkbox.click
    assert fenced_yard_checkbox.checked?
    children_checkbox = find("input[value='has_children']", visible: false)
    children_checkbox.click
    assert children_checkbox.checked?

    find("#person_home_type", visible: false)
    select "House", from: "home_type"

    find("#person_is_home_during_day input[value='1']", visible: false).click

    find("#person_animal_kind_preferences_attributes input[value='1']", visible: false).click
    find("#person_animal_gender_preferences_attributes input[value='1']", visible: false).click
    find("#person_animal_age_preferences_attributes input[value='1']", visible: false).click
    find("#person_animal_size_preferences_attributes input[value='1']", visible: false).click

    find("#person_transportation", visible: false)
    select("Car", from: "transportation")

    find("button").click

    sleep 1
    assert_selector("div", text: "Successfully Submitted")

    mail = ActionMailer::Base.deliveries.last
    body = Nokogiri::HTML(mail.body.raw_source)

    assert_equal "peter@github.com", mail.to.first
    assert_match /your login link/, body.to_s
  end
end
