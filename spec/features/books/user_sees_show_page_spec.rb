require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do

  it 'shows info about the book' do
    author = Author.create(name: "steve jobs")
    book = author.books.create(title: "Story about me", pages: 300, year_published: 300, thumbnail: "gibbergabber")

    visit "/books/#{book.id}"

    expect(page).to have_content(book.title)
    expect(page).to have_content(book.pages)
    expect(page).to have_content(book.authors.first.name)
    expect(page).to have_content(book.year_published)

  end

  it 'shows reviews for the book' do
    author = Author.create(name: "steve jobs")
    book = author.books.create(title: "Story about me", pages: 300, year_published: 300, thumbnail: "gibbergabber")
    user = User.create(name: "steve jobs")
    review = book.reviews.create(title: "It sucked", description: "blah blah blah", rating: 5, user_id: user.id)

    visit "/books/#{book.id}"

    expect(page).to have_content(review.title)
    expect(page).to have_content(review.description)
    expect(page).to have_content(review.rating)
    expect(page).to have_content(review.user.name)
    expect(page).to have_xpath("//img[@src='gibbergabber']")
  end

end
