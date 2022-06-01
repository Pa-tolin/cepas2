require "application_system_test_case"

class EnologistMagazinesTest < ApplicationSystemTestCase
  setup do
    @enologist_magazine = enologist_magazines(:one)
  end

  test "visiting the index" do
    visit enologist_magazines_url
    assert_selector "h1", text: "Enologist Magazines"
  end

  test "creating a Enologist magazine" do
    visit enologist_magazines_url
    click_on "New Enologist Magazine"

    click_on "Create Enologist magazine"

    assert_text "Enologist magazine was successfully created"
    click_on "Back"
  end

  test "updating a Enologist magazine" do
    visit enologist_magazines_url
    click_on "Edit", match: :first

    click_on "Update Enologist magazine"

    assert_text "Enologist magazine was successfully updated"
    click_on "Back"
  end

  test "destroying a Enologist magazine" do
    visit enologist_magazines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Enologist magazine was successfully destroyed"
  end
end
