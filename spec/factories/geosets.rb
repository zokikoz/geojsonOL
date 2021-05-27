FactoryBot.define do
  factory :geoset do
    id { 1 }
    name { 'GeoJSON polygon' }
    geojson { '{"type":"FeatureCollection","features":[{"type":"Feature","properties":{},"geometry":{"type":"Polygon","coordinates":[[[103.0078125,50.84757295365389],[111.26953125,50.84757295365389],[111.26953125,56.072035471800866],[103.0078125,56.072035471800866],[103.0078125,50.84757295365389]]]}}]}' }
  end
end
