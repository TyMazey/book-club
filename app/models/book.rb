class Book < ApplicationRecord

  has_many :author_books
  has_many :authors, through: :author_books

  validates_presence_of :title
  validates_presence_of :pages
  validates_presence_of :year_published

  def name_as_kebab
    title.downcase.gsub(/ /, "-")
  end
end
