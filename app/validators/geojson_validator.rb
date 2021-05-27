# Validates GeoJSON format
class GeojsonValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    json_hash = JSON.parse(value)
    raise StandardError, 'Missing GeoJSON data' unless %w[Feature FeatureCollection].include?(json_hash['type'])
  rescue StandardError => e
    record.logger.error "GeoJSON parse error: #{e.message}"
    record.errors.add(attribute, 'ivalid format')
  end
end
