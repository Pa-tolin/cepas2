require "application_system_test_case"

class EnologistWinesTest < ApplicationSystemTestCase
  setup do
    @enologist_wine = enologist_wines(:one)
  end

  test "visiting the index" do
    visit enologist_wines_url
    assert_selector "h1", text: "Enologist Wines"
  end

  test "creating a Enologist wine" do
    visit enologist_wines_url
    click_on "New Enologist Wine"

    click_on "Create Enologist wine"

    assert_text "Enologist wine was successfully created"
    click_on "Back"
  end

  test "updating a Enologist wine" do
    visit enologist_wines_url
    click_on "Edit", match: :first

    click_on "Update Enologist wine"

    assert_text "Enologist wine was successfully updated"
    click_on "Back"
  end

  test "destroying a Enologist wine" do
    visit enologist_wines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Enologist wine was successfully destroyed"
  end
end
