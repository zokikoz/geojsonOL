require 'rails_helper'

RSpec.describe "geosets/show", type: :view do
  before(:each) do
    @geoset = assign(:geoset, Geoset.create!(geojson: '{"type":"FeatureCollection","features":[{"type":"Feature","properties":{},"geometry":{"type":"Polygon","coordinates":[[[103.0078125,50.84757295365389],[111.26953125,50.84757295365389],[111.26953125,56.072035471800866],[103.0078125,56.072035471800866],[103.0078125,50.84757295365389]]]}}]}'))
  end

  it "renders attributes in <p>" do
    render
  end
end
