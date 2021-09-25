require "application_system_test_case"

class AnimalApplicationsTest < ApplicationSystemTestCase
  setup do
    @animal_application = animal_applications(:one)
  end

  test "visiting the index" do
    visit animal_applications_url
    assert_selector "h1", text: "Animal application"
  end

  test "should create Animal application" do
    visit animal_applications_url
    click_on "New Animal application"

    fill_in "inspiration", with: "pls approve me"
    fill_in "start_date", with: "2021-09-20"
    click_on "Create Animal application"

    assert_text "Animal application was successfully created"
    click_on "Back"
  end
end
