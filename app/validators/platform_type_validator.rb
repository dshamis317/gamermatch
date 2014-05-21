class PlatformTypeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << "Invalid platform. Let's try and pick something that works online." if platform_whitelist.index(value).nil?
  end

  private

  def platform_whitelist
    ["Android", "iPhone", "iPad", "PlayStation 3", "PlayStation 4", "PlayStation Vita", "Xbox 360", "Xbox One", "PC", "Mac"]
  end

end
