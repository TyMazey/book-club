require 'rails_helper'

RSpec.describe Book, type: :model do

  describe 'relationships' do

    it {should have_many :author_books}
    it {should have_many :reviews}
    it {should have_many(:authors).through :author_books}
  end

  describe 'validations' do

    it {should validate_presence_of :title}
    it {should validate_presence_of :pages}
    it {should validate_presence_of :year_published}
  end

  describe 'instance methods' do

    describe '.remove_author' do
      it 'should remove an authors name' do
        author = Author.create(name: "Baby Jesus")
        author_2 = Author.create(name: "Rickey Bobby")
        book_1 = Book.create(title: "Moby Dick", pages: 100, year_published: 1900, thumbnail: "gibberish", authors: [author, author_2])

        expect(book_1.remove_author(author)).to eq([author_2])
      end
    end

    describe '.average_rating' do
      author = Author.create(name: "Rickey Bobby")
      book_1 = Book.create(title: "Moby Dick", pages: 100, year_published: 1900, thumbnail: "gibberish", authors: [author])
      review = book_1.reviews.create(title: "Amazing", description: "Really", rating: 5, user_id: 1)
      review = book_1.reviews.create(title: "Amazing", description: "Really", rating: 1, user_id: 2)
      review = book_1.reviews.create(title: "Amazing", description: "Really", rating: 3, user_id: 5)

      expect(book_1.average_rating).to eq(3)
    end

    describe '.total_reviews' do
      author = Author.create(name: "Rickey Bobby")
      book_1 = Book.create(title: "Moby Dick", pages: 100, year_published: 1900, thumbnail: "gibberish", authors: [author])
      review = book_1.reviews.create(title: "Amazing", description: "Really", rating: 5, user_id: 1)
      review = book_1.reviews.create(title: "Amazing", description: "Really", rating: 1, user_id: 2)
      review = book_1.reviews.create(title: "Amazing", description: "Really", rating: 3, user_id: 5)

      expect(book_1.total_reviews).to eq(3)
    end
  end
end
