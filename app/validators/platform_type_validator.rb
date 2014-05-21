class PlatformTypeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless Platform::WHITELIST.include?(value)
      record.errors[attribute] << "Invalid platform. Let's try and pick something that works online."
    end
  end

  private

end
