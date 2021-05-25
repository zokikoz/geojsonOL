class Geoset < ApplicationRecord
  # Should be before has_one_attached to find file, because _after callbacks run in reverse order
  after_commit :json_upload, on: [:create, :update], if: -> { geojson_file.attached? }

  has_one_attached :geojson_file

  private

  def json_upload
    json = JSON.parse(geojson_file.download)
    # Using direct UPDATE SQL via update_column method to avoid infinite loop on callback
    update_column(:geojson, json)
  end
end
