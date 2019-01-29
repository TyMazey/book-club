require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do

  it 'shows info about the book' do
    author = Author.create(name: "steve jobs")
    book = author.books.create(title: "Story about me", pages: 300, year_published: 300, thumbnail: "gibbergabber")

    visit '/books/:id'

    expect(page).to have_content(book.title)
    expect(page).to have_content(book.pages)
    expect(page).to have_content(book.authors.first.name)
    expect(page).to have_content(book.year_published)

  end

end
