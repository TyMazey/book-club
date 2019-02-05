class Book < ApplicationRecord
  has_many :reviews
  has_many :author_books
  has_many :authors, through: :author_books

  validates_presence_of :title
  validates_presence_of :pages
  validates_presence_of :year_published

  def remove_author(author)
    authors.where.not(id: author.id)
  end

  def total_reviews
    reviews.count
  end

  def average_rating
    reviews.average(:rating)
  end

  def top_reviews(amount)
    reviews.order(rating: :desc, title: :desc).limit(amount)
  end

  def bottom_reviews
    reviews.order(rating: :asc, title: :desc).limit(3)
  end


  def self.sort_by(params)
    if params == 'highest_rated'
      select("books.*, avg(reviews.rating) AS avg_rating")
      .joins(:reviews)
      .group(:book_id, :id)
      .order("avg_rating DESC")
    elsif params == 'lowest_rated'
      select("books.*, avg(reviews.rating) AS avg_rating")
      .joins(:reviews)
      .group(:book_id, :id)
      .order("avg_rating ASC")
    elsif params == 'most_pages'
      order(pages: :desc)
    elsif params == 'least_pages'
      order(pages: :asc)
    elsif params == 'most_reviews'
      select("books.*, count(reviews) AS total_reviews")
      .joins(:reviews)
      .group(:book_id, :id)
      .order("total_reviews DESC")
    elsif params == 'least_reviews'
      select("books.*, count(reviews) AS total_reviews")
      .joins(:reviews)
      .group(:book_id, :id)
      .order("total_reviews ASC")
    else
      Book.all
    end
  end

  def self.best_books
    joins(:reviews).select("avg(reviews.rating) as book_rating, books.*")
                    .group(:id)
                    .order("book_rating DESC")
                    .limit(3)
  end

  def self.worst_books
    joins(:reviews).select("avg(reviews.rating) as book_rating, books.*")
                    .group(:id)
                    .order("book_rating ASC")
                    .limit(3)
  end
end
