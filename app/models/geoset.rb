class Geoset < ApplicationRecord
  attr_accessor :err_message

  # Should be before has_one_attached to find file, because _after callbacks run in reverse order
  after_commit :json_upload, on: %i[create update], if: -> { geojson_file.attached? }, unless: -> { @no_callback }
  before_save :json_parse, unless: -> { geojson_file.attached? }
  before_save :set_status

  with_options unless: -> { geojson_file.attached? } do |geoset|
    geoset.validates :geojson, presence: true
    geoset.validates :geojson, geojson: true
  end

  has_one_attached :geojson_file
  validates :geojson_file, file_type: ['application/geo+json']

  def raw_geojson
    geojson.to_json
  end

  private

  def json_parse
    self.geojson = JSON.parse(geojson)
  end

  def set_status
    @is_new = new_record?
  end

  def json_upload
    # Disabling callbacks because purge method updates the model
    @no_callback = true
    json = JSON.parse(geojson_file.download)
    # Using direct UPDATE SQL via update_column method to avoid infinite loop on callback
    update_column(:geojson, json)
    # Removing uploaded file
    geojson_file.purge
  rescue StandardError => e
    logger.error "GeoJSON parse error: #{e.message}"
    self.err_message = 'Unable to upload file'
    # Cleaning up after upload error
    if @is_new
      destroy
    else
      geojson_file.purge
      update_column(:geojson, JSON.parse(geojson))
    end
  end
end
