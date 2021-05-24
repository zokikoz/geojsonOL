class Geoset < ApplicationRecord
  has_one_attached :geojson_file
end
