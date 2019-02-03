class Author < ApplicationRecord

  has_many :author_books
  has_many :books, through: :author_books

  validates_presence_of :name

  def best_review
    review_obj = Review.joins(:book).order(rating: :desc).limit(1)[0]
    if review_obj == nil
      review = {'title' => 'No Reviews Yet', 'rating' => '', 'user' => ''}
    else
      review = review_obj.attributes
      review['user'] = User.find(review['user_id']).name
      review
    end
  end
end
