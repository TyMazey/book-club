class User < ApplicationRecord
  has_many :reviews

  validates_presence_of :name

  def self.top_review_users
    joins(:reviews).select("count(reviews.id) as count_reviews, users.*").group(:id).order("
    count_reviews DESC").limit(3)
  end
end
