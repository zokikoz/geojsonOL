require 'rails_helper'

RSpec.describe "geosets/index", type: :view do
  before(:each) do
    assign(:geosets, [
      Geoset.create!(geojson: '{"type":"FeatureCollection","features":[{"type":"Feature","properties":{},"geometry":{"type":"Polygon","coordinates":[[[103.0078125,50.84757295365389],[111.26953125,50.84757295365389],[111.26953125,56.072035471800866],[103.0078125,56.072035471800866],[103.0078125,50.84757295365389]]]}}]}'),
      Geoset.create!(geojson: '{"type":"FeatureCollection","features":[{"type":"Feature","properties":{},"geometry":{"type":"Polygon","coordinates":[[[102.10693359375,56.559482483762245],[101.865234375,51.20688339486559],[110.32470703125,51.20688339486559],[110.36865234374999,56.559482483762245],[102.10693359375,56.559482483762245]]]}}]}')
    ])
  end

  it "renders a list of geosets" do
    render
  end
end
