FactoryBot.define do
  factory :geoset do
    id { 1 }
    name { 'GeoJSON polygon' }
    geojson { '{"type":"FeatureCollection","features":[]}' }

    trait :with_file do
      geojson_file = File.open(Rails.root.join('spec', 'fixtures', 'map.geojson'))
      Rack::Test::UploadedFile.new(geojson_file, 'application/geo+json', true, original_filename: 'map.geojson')
    end
  end
end
