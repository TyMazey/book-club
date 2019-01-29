class Book < ApplicationRecord
  def name_as_kebab
    title.downcase.gsub(/ /, "-")
  end
end
