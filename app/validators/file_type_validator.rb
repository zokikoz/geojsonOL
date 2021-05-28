# Validates Active Storage file content MIME type
class FileTypeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value.attached?
    return if value.content_type.in?(content_types)

    record.errors.add(attribute, 'invalid content')
  end

  private

  def content_types
    options.fetch(:in)
  end
end
