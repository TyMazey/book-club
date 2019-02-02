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
      it 'can return the average rating for a book' do
        author = Author.create(name: "Rickey Bobby")
        book_1 = Book.create(title: "Moby Dick", pages: 100, year_published: 1900, thumbnail: "gibberish", authors: [author])
        user_1 = User.create(name: "bob")
        user_2 = User.create(name: "rob")
        user_3 = User.create(name: "tod")
        review = book_1.reviews.create(title: "Amazing", description: "Really", rating: 5, user: user_1)
        review = book_1.reviews.create(title: "Amazing", description: "Really", rating: 1, user: user_2)
        review = book_1.reviews.create(title: "Amazing", description: "Really", rating: 3, user: user_3)

        expect(book_1.average_rating).to eq(3)
      end
    end

    describe '.total_reviews' do
      it 'can return the total number of reviews for a book' do
        author = Author.create(name: "Rickey Bobby")
        book_1 = Book.create(title: "Moby Dick", pages: 100, year_published: 1900, thumbnail: "gibberish", authors: [author])
        user_1 = User.create(name: "bob")
        user_2 = User.create(name: "rob")
        user_3 = User.create(name: "tod")
        review = book_1.reviews.create(title: "Amazing", description: "Really", rating: 5, user: user_1)
        review = book_1.reviews.create(title: "Amazing", description: "Really", rating: 1, user: user_2)
        review = book_1.reviews.create(title: "Amazing", description: "Really", rating: 3, user: user_3)

        expect(book_1.total_reviews).to eq(3)
      end
    end
  end

  describe 'class methods' do
    describe '.sort_by' do
      it 'should be able to sort books' do
        author = Author.create(name: "Rickey Bobby")
        book_1 = Book.create(title: "Moby Dick", pages: 100, year_published: 1900, thumbnail: "gibberish", authors: [author])
        book_2 = Book.create(title: "Sobby Rick", pages: 200, year_published: 1900, thumbnail: "gibberish", authors: [author])
        user_1 = User.create(name: "bob")
        user_2 = User.create(name: "rob")
        user_3 = User.create(name: "tod")
        book_1.reviews.create(title: "Amazing", description: "Really", rating: 5, user: user_1)
        book_1.reviews.create(title: "Amazing", description: "Really", rating: 1, user: user_2)
        book_1.reviews.create(title: "Amazing", description: "Really", rating: 3, user: user_3)
        book_2.reviews.create(title: "Amazing", description: "Really", rating: 5, user: user_1)
        book_2.reviews.create(title: "Amazing", description: "Really", rating: 4, user: user_2)

        expect(Book.sort_by('highest_rated')).to eq([book_2, book_1])
        expect(Book.sort_by('lowest_rated')).to eq([book_1, book_2])
        expect(Book.sort_by('most_pages')).to eq([book_2, book_1])
        expect(Book.sort_by('least_pages')).to eq([book_1, book_2])
        expect(Book.sort_by('most_reviews')).to eq([book_1, book_2])
        expect(Book.sort_by('least_reviews')).to eq([book_2, book_1])
      end
    end
  end
end
