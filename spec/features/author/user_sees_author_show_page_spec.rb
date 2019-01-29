require 'rails_helper'

RSpec.describe 'as visitor', type: :feature do

  it 'shows me information about an author' do
    author = Author.create(name: "bob")
    book_1 = author.books.create(title: "book 1", pages: 100, year_published: 1901, thumbnail: "picture url")
    book_2 = author.books.create(title: "book_1", pages: 200, year_published:1702, thumbnail: "picture url")

    visit author_path(author)

    expect(page).to have_content(author.name)

    within '.books' do
      expect(page).to have_content(book_1.title)
      expect(page).to have_content(book_1.pages)
      expect(page).to have_content(book_1.year_published)
      expect(page).to_not have_content(author.name)
      expect(page).to have_xpath("//img[@src='picture url']")
      expect(page).to have_content(book_2.title)
      expect(page).to have_content(book_2.pages)
      expect(page).to have_content(book_2.year_published)
      expect(page).to_not have_content(author.name)
      expect(page).to have_xpath("//img[@src='picture url']")
    end
  end

  it 'has links to book show page in book title' do
    author = Author.create(name: "bob")
    book_1 = author.books.create(title: "book 1", pages: 100, year_published: 1901, thumbnail: "picture url")
    book_2 = author.books.create(title: "book_2", pages: 200, year_published: 1702, thumbnail: "picture url")

    visit author_path(author)

    click_link("book 1", :text => "book 1")

    expect(current_path).to eq "/books/#{book_1}"
    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_1.year_published)

    expect(page).to_not have_content(book_2.title)
  end
end
