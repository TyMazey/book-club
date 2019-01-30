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

    describe '.remove_self_from_books' do
      it 'should remove its own name from books as author' do
        author = Author.create(name: "Baby Jesus")
        author_2 = Author.create(name: "Rickey Bobby")
        book_1 = Book.create(title: "Moby Dick", pages: 100, year_published: 1900, thumbnail: "gibberish", authors: [author, author_2])
        new_book = author.remove_self_from_books.first.authors


        expect(new_book).to eq(["Rickey Bobby"])
      end
    end
  end
end
