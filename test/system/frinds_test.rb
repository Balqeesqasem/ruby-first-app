require "application_system_test_case"

class FrindsTest < ApplicationSystemTestCase
  setup do
    @frind = frinds(:one)
  end

  test "visiting the index" do
    visit frinds_url
    assert_selector "h1", text: "Frinds"
  end

  test "creating a Frind" do
    visit frinds_url
    click_on "New Frind"

    fill_in "Email", with: @frind.email
    fill_in "First name", with: @frind.first_name
    fill_in "Last name", with: @frind.last_name
    fill_in "Phone", with: @frind.phone
    click_on "Create Frind"

    assert_text "Frind was successfully created"
    click_on "Back"
  end

  test "updating a Frind" do
    visit frinds_url
    click_on "Edit", match: :first

    fill_in "Email", with: @frind.email
    fill_in "First name", with: @frind.first_name
    fill_in "Last name", with: @frind.last_name
    fill_in "Phone", with: @frind.phone
    click_on "Update Frind"

    assert_text "Frind was successfully updated"
    click_on "Back"
  end

  test "destroying a Frind" do
    visit frinds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Frind was successfully destroyed"
  end
end
