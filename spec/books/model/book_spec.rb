require 'rails_helper'

RSpec.describe Book do
  describe 'class methods' do
    describe '.name_as_kebab' do
      it '.name_as_kebab' do
        book_1 = Book.create(title: "Moby Dick", pages: 100, year_published: 1900, thumbnail: "gibberish")

        expect(book_1.name_as_kebab).to eq("moby-dick")
      end
    end
  end
end
