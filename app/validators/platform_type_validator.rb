class PlatformTypeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless platform_whitelist.include?(value)
      record.errors[attribute] << "Invalid platform. Let's try and pick something that works online."
    end
  end

  private

  def platform_whitelist
    [
      "Android",
      "iPhone",
      "iPad",
      "PlayStation 3",
      "PlayStation 4",
      "PlayStation Vita",
      "PlayStation Network (PS3)",
      "PlayStation Network (Vita)",
      "PlayStation Network (PS4)",
      "Xbox 360",
      "Xbox One",
      "PC",
      "Mac"
    ]
  end

end
