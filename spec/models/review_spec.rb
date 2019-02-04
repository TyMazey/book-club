require 'rails_helper'


RSpec.describe Review, type: :model do

  describe 'relationships' do

    it {should belong_to :book}
    it {should belong_to :user}
  end

  describe 'validations' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :description}
    it {should validate_presence_of :rating}
    it {should validate_presence_of :user_id}
  end

  describe 'class methods' do
    describe '.sort_by' do
      it 'should sort reviews based on params' do
        user = User.create(name: 'Bobby')
        author = Author.create(name: 'Author')
        book_1 = author.books.create(title: 'book', pages: 200, year_published: 1012, )
        book_2 = author.books.create(title: 'book 2', pages: 300, year_published: 2019, )
        review_1 = book_1.reviews.create(title: 'good', description: 'aight', rating: 3, book_id: book_2.id, user_id: user.id)
        review_2 = book_2.reviews.create(title: 'better', description: 'yay', rating: 4, book_id: book_1.id, user_id: user.id)

        expect(Review.sort_reviews('newest')).to eq([review_2, review_1])
        expect(Review.sort_reviews('oldest')).to eq([review_1, review_2])
      end
    end
  end

  describe 'instance methods' do
  end

end
