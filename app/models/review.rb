class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates_presence_of :title, :description, :rating, :user_id

  def self.sort_reviews(params)
    if params == 'newest'
      order(created_at: :desc)
    elsif params == 'oldest'
      order(created_at: :asc)
    else
      all
    end
  end
end
