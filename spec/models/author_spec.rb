require 'rails_helper'

RSpec.describe Author, type: :model do

  describe 'relationship' do
    it {should have_many :author_books}
    it {should have_many(:books).through :author_books}
  end

  describe 'validations' do

    it {should validate_presence_of :name}
  end

  describe 'instance methods' do
    describe '.best_review' do
      it 'returns the top review for a specific author' do
        author = Author.create(name: "bob")
        book = author.books.create(title: "book 1", pages: 100, year_published: 1901, thumbnail: "picture url")
        user = User.create(name: 'Bob')
        user_1 = User.create(name: 'Jeef')
        good = book.reviews.create(title: 'great', description: 'great', rating: 5, user: user)
        bad = book.reviews.create(title: 'bad', description: 'bad', rating: 1, user: user_1)

        expect(author.best_review).to eq(good)
      end
    end
  end
end
