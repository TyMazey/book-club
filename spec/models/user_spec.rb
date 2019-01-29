require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'relationships' do
    it {should have_many :reviews}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'class methods' do
    it '.top_review_users' do
      author = Author.create(name: "Rickey Bobby")
      book_1 = Book.create(title: "Moby Dick", pages: 100, year_published: 1900, thumbnail: "gibberish", authors: [author])
      user_3 = User.create(name: "tod")
      user_4 = User.create(name: "steve")
      user_2 = User.create(name: "rob")
      user_1 = User.create(name: "bob")
      5.times {book_1.reviews.create(title: "Amazing", description: "Really", rating: 5, user: user_1)}
      4.times {book_1.reviews.create(title: "Amazing", description: "Really", rating: 5, user: user_2)}
      3.times {book_1.reviews.create(title: "Amazing", description: "Really", rating: 5, user: user_3)}
      2.times {book_1.reviews.create(title: "Amazing", description: "Really", rating: 5, user: user_4)}

      top_reviewers = [user_1, user_2, user_3]
      expect(User.top_review_users).to eq(top_reviewers)
    end
  end

  describe 'instance methods' do
  end


end
