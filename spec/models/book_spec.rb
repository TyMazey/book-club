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
    it '.best_books' do
      user_1 = User.create(name: "bob")
      book_2 = Book.create(title: "Hitch Hikers: A strange tail", pages: 302, year_published: 1940, thumbnail: "harby")
      book_4 = Book.create(title: "Mortal Enemies", pages: 400, year_published: 1970, thumbnail: "friendly")
      book_1 = Book.create(title: "Moby Dick", pages: 100, year_published: 1900, thumbnail: "gibberish")
      book_3 = Book.create(title: "Colin's Odd Trip", pages: 20, year_published: 2100, thumbnail: "strange")
      book_1.reviews.create(title: "Amazing", description: "Really", rating: 5, user: user_1)
      book_1.reviews.create(title: "Amazing", description: "Really", rating: 4, user: user_1)
      book_2.reviews.create(title: "Amazing", description: "Really", rating: 4, user: user_1)
      book_3.reviews.create(title: "Amazing", description: "Really", rating: 3, user: user_1)
      book_4.reviews.create(title: "Amazing", description: "Really", rating: 1, user: user_1)

      top_3 = [book_1, book_2, book_3]

      expect(Book.best_books).to eq(top_3)
    end

    it '.worst_books' do
      user_1 = User.create(name: "bob")
      book_2 = Book.create(title: "Hitch Hikers: A strange tail", pages: 302, year_published: 1940, thumbnail: "harby")
      book_4 = Book.create(title: "Mortal Enemies", pages: 400, year_published: 1970, thumbnail: "friendly")
      book_1 = Book.create(title: "Moby Dick", pages: 100, year_published: 1900, thumbnail: "gibberish")
      book_3 = Book.create(title: "Colin's Odd Trip", pages: 20, year_published: 2100, thumbnail: "strange")
      book_2.reviews.create(title: "Amazing", description: "Really", rating: 4, user: user_1)
      book_1.reviews.create(title: "Amazing", description: "Really", rating: 5, user: user_1)
      book_3.reviews.create(title: "Amazing", description: "Really", rating: 3, user: user_1)
      book_4.reviews.create(title: "Amazing", description: "Really", rating: 1, user: user_1)
      book_1.reviews.create(title: "Amazing", description: "Really", rating: 4, user: user_1)

      worst_3 = [book_4, book_3, book_2]

      expect(Book.worst_books).to eq(worst_3)
    end

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

      expect(Book.top_review_users).to eq(top_reviewers)
    end
  end
end
