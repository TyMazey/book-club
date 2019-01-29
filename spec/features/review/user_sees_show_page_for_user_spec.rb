require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do

  it 'Shows all information about a user' do
    book = Book.create(title: "about me", pages: 420, year_published: 1928, thumbnail: "ixat yzarc")
    user = User.create(name: "Andre")
    review = user.reviews.create(title: "Meh", description: "Blah Blah Blah", rating: 3, book_id: book.id)

    visit user_path(user)

    expect(page).to have_content(user.name)

    within ".reviews"
    expect(page).to have_content(review.title)
    expect(page).to have_content(review.description)
    expect(page).to have_content(review.rating)
    expect(page).to have_content(book.title)
    expect(page).to have_xpath("//img[@src='ixat yzarc']")
    expect(page).to have_content(review.created_at)
  end

  it 'has a link to the book show page in the book title' do
    book = Book.create(title: "about me", pages: 420, year_published: 1928, thumbnail: "ixat yzarc")
    user = User.create(name: "Andre")
    review = user.reviews.create(title: "Meh", description: "Blah Blah Blah", rating: 3, book_id: book.id)

    visit user_path(user)

    click_link("about me", :text => "about me")

    expect(current_path).to eq "/books/#{book.id}"
    expect(page).to have_content(book.title)
    expect(page).to have_content(book.pages)
    expect(page).to have_content(book.year_published)
  end
end
