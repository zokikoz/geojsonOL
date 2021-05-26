require 'rails_helper'

RSpec.describe "geosets/edit", type: :view do
  before(:each) do
    @geoset = assign(:geoset, Geoset.create!(geojson: '{"type":"FeatureCollection","features":[{"type":"Feature","properties":{},"geometry":{"type":"Polygon","coordinates":[[[103.0078125,50.84757295365389],[111.26953125,50.84757295365389],[111.26953125,56.072035471800866],[103.0078125,56.072035471800866],[103.0078125,50.84757295365389]]]}}]}'))
  end

  it "renders the edit geoset form" do
    render

    assert_select "form[action=?][method=?]", geoset_path(@geoset), "post" do
    end
  end
end
