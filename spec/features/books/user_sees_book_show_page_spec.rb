require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do

  it 'shows info about the book' do
    author = Author.create(name: "steve jobs")
    book = author.books.create(title: "Story about me", pages: 300, year_published: 300, thumbnail: "gibbergabber")

    visit book_path(book)

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

    visit book_path(book)

    expect(page).to have_content(review.title)
    expect(page).to have_content(review.description)
    expect(page).to have_content(review.rating)
    expect(page).to have_content(review.user.name)
    expect(page).to have_xpath("//img[@src='gibbergabber']")
  end

  it 'shows statistics in the show page' do
    author = Author.create(name: "steve jobs")
    user_1 = User.create(name: "bob")
    book_1 = author.books.create(title: "Story about me", pages: 300, year_published: 300, thumbnail: "gibbergabber")
    review_1 = book_1.reviews.create(title: "spectacular", description: "Really", rating: 5, user: user_1)
    review_2 = book_1.reviews.create(title: "Amazing", description: "Really", rating: 4, user: user_1)
    review_3 = book_1.reviews.create(title: "meh", description: "Really", rating: 4, user: user_1)
    review_4 = book_1.reviews.create(title: "horrible", description: "Really", rating: 2, user: user_1)

    top_review = book_1.top_reviews(2)
    bottom_reviews = book_1.bottom_reviews

    visit book_path(book_1)

    within '#top-reviews' do
      expect(page).to have_content("Title: spectacular")
      expect(page).to_not have_content("horrible")
    end

    within '#bottom-reviews' do
      expect(page).to have_content("Title: meh")
      expect(page).to_not have_content("spectacular")
    end

    within '#overall' do
      expect(page).to have_content("Overall Rating: 3.75")
    end
  end

end
