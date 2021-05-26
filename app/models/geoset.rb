class Geoset < ApplicationRecord
  # Should be before has_one_attached to find file, because _after callbacks run in reverse order
  after_commit :json_upload, on: [:create, :update], if: -> { geojson_file.attached? }

  validates :geojson, presence: true, unless: -> { geojson_file.attached? }
  validate :file_format

  has_one_attached :geojson_file

  private

  def file_format
    return unless geojson_file.attached?
    return if geojson_file.content_type.in?(['application/geo+json'])

    errors.add(:geojson_file, 'Invalid file format')
  end

  def json_upload
    json = JSON.parse(geojson_file.download)
    # Using direct UPDATE SQL via update_column method to avoid infinite loop on callback
    update_column(:geojson, json)
  end
end
