require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do

  it 'has a link to add a new review' do
    author = Author.create(name: 'bob')
    book = author.books.create(title: 'new', pages: 500, year_published: 1999, thumbnail: 'picture.url', )

    visit book_path(book.id)

    click_link 'New Review'

    expect(current_path).to eq(new_book_review_path(book.id))
  end
end
