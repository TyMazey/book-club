require 'rails_helper'

RSpec.describe 'as visitor', type: :model do

  it 'shows me information about an author' do
    author = Author.create(name: "bob")
    book_1 = author.books.create(title: "book 1", pages: 100, year_published: 1901, thumbnail: "pictur url")
    book_2 = author.books.create(title: "book_1", pages: 200, year_published:1702, thumbnail: "picture url")


    visit author_path(author)

    expect(page).to have_content(author.name)
    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_1.pages)
    expect(page).to have_content(book_1.year_published)
    expect(page).to have_content(book_1.thumbnail)
    expect(page).to have_content(book_2.title)
    expect(page).to have_content(book_2.pages)
    expect(page).to have_content(book_2.year_published)
    expect(page).to have_content(book_2.thumbnail)
  end
end
