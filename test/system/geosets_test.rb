require "application_system_test_case"

class GeosetsTest < ApplicationSystemTestCase
  setup do
    @geoset = geosets(:one)
  end

  test "visiting the index" do
    visit geosets_url
    assert_selector "h1", text: "Geosets"
  end

  test "creating a Geoset" do
    visit geosets_url
    click_on "New Geoset"

    fill_in "Geojson", with: @geoset.geojson
    fill_in "Name", with: @geoset.name
    click_on "Create Geoset"

    assert_text "Geoset was successfully created"
    click_on "Back"
  end

  test "updating a Geoset" do
    visit geosets_url
    click_on "Edit", match: :first

    fill_in "Geojson", with: @geoset.geojson
    fill_in "Name", with: @geoset.name
    click_on "Update Geoset"

    assert_text "Geoset was successfully updated"
    click_on "Back"
  end

  test "destroying a Geoset" do
    visit geosets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Geoset was successfully destroyed"
  end
end
