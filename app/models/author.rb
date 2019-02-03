class Author < ApplicationRecord

  has_many :author_books
  has_many :books, through: :author_books

  validates_presence_of :name

  def best_review
    Review.joins(:book).order(rating: :desc).limit(1)
  end
end
