require "test_helper"

class GeosetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @geoset = geosets(:one)
  end

  test "should get index" do
    get geosets_url
    assert_response :success
  end

  test "should get new" do
    get new_geoset_url
    assert_response :success
  end

  test "should create geoset" do
    assert_difference('Geoset.count') do
      post geosets_url, params: { geoset: { geojson: @geoset.geojson, name: @geoset.name } }
    end

    assert_redirected_to geoset_url(Geoset.last)
  end

  test "should show geoset" do
    get geoset_url(@geoset)
    assert_response :success
  end

  test "should get edit" do
    get edit_geoset_url(@geoset)
    assert_response :success
  end

  test "should update geoset" do
    patch geoset_url(@geoset), params: { geoset: { geojson: @geoset.geojson, name: @geoset.name } }
    assert_redirected_to geoset_url(@geoset)
  end

  test "should destroy geoset" do
    assert_difference('Geoset.count', -1) do
      delete geoset_url(@geoset)
    end

    assert_redirected_to geosets_url
  end
end
