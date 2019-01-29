require 'rails_helper'

RSpec.describe Book, type: :model do

  describe 'relationships' do

    it {should have_many :authors}
  end

  describe 'validations' do

    it {should validate_presence_of :title}
    it {should validate_presence_of :pages}
    it {should validate_presence_of :year_published}
  end 

  describe 'instance methods' do
    describe '.name_as_kebab' do
      it '.name_as_kebab' do
        book_1 = Book.create(title: "Moby Dick", pages: 100, year_published: 1900, thumbnail: "gibberish")

        expect(book_1.name_as_kebab).to eq("moby-dick")
      end
    end
  end
end
