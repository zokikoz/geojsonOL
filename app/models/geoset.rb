class Geoset < ApplicationRecord
  attr_accessor :err_message

  # Should be before has_one_attached to find file, because _after callbacks run in reverse order
  after_commit :json_upload, on: %i[create update], if: -> { geojson_file.attached? }, unless: -> { @no_callback }
  before_save :json_parse, unless: -> { geojson_file.attached? }

  with_options unless: -> { geojson_file.attached? } do |geoset|
    geoset.validates :geojson, presence: true
    geoset.validates :geojson, geojson: true
  end

  has_one_attached :geojson_file
  validates :geojson_file, file_type: ['application/geo+json']

  private

  def json_parse
    self.geojson = JSON.parse(geojson)
  end

  def json_upload
    json = JSON.parse(geojson_file.download)
    # Using direct UPDATE SQL via update_column method to avoid infinite loop on callback
    update_column(:geojson, json)
    # Disabling callbacks because purge method updates the model
    @no_callback = true
    # Removing uploaded file
    geojson_file.purge
  rescue StandardError => e
    logger.error "GeoJSON parse error: #{e.message}"
    destroy
    self.err_message = 'Unable to upload file'
  end
end
