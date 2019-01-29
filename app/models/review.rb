class Review < ApplicationRecord
  belongs_to :book

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :rating
  validates_presence_of :user_id
end
