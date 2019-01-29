require 'rails_helper'

RSpec.describe 'As a vistitor', type: :feature do

  it 'shows all books' do
    author = Author.create(name: "Bobby Bob")
    book_1 = author.books.create(title: "Moby Dick", pages: 100, year_published: 1900, thumbnail: "gibberish")
    book_2 = author.books.create(title: "Dante's Inferno", pages: 500, year_published: 1840, thumbnail: "gibberfish")

    visit books_path

    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_2.title)
  end

  it 'shows book info' do
    author = Author.create(name: "Baby Jesus")
    author_2 = Author.create(name: "Rickey Bobby")
    book_1 = Book.create(title: "Moby Dick", pages: 100, year_published: 1900, thumbnail: "gibberish", authors: [author, author_2])

    visit books_path

    within "#book-#{book_1.id}" do
      expect(page).to have_content(book_1.title)
      expect(page).to have_content(book_1.authors.first.name)
      expect(page).to have_content(book_1.authors.last.name)
      expect(page).to have_content(book_1.pages)
      expect(page).to have_content(book_1.year_published)
      expect(page).to have_xpath("//img[@src='gibberish']")
    end
  end

  it 'has link to book show page' do
    author = Author.create(name: "Bobby Bob")
    book_1 = author.books.create(title: "Moby Dick", pages: 100, year_published: 1900, thumbnail: "gibberish")

    visit books_path

    click_on "Mody Dick"

    expect(current_path).to eq "/books/#{book_1.id}"
  end
end
