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

    # save_and_open_page

    click_link("Moby Dick", :text => "Moby Dick")

    expect(current_path).to eq book_path(book_1)
    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_1.pages)
    expect(page).to have_content(book_1.year_published)
  end

  it 'shows average rating for books' do


    author = Author.create(name: "Rickey Bobby")
    book_1 = Book.create(title: "Moby Dick", pages: 100, year_published: 1900, thumbnail: "gibberish", authors: [author])
    user_1 = User.create(name: "bob")
    user_2 = User.create(name: "rob")
    user_3 = User.create(name: "tod")
    review = book_1.reviews.create(title: "Amazing", description: "Really", rating: 5, user: user_1)
    review = book_1.reviews.create(title: "Amazing", description: "Really", rating: 1, user: user_2)
    review = book_1.reviews.create(title: "Amazing", description: "Really", rating: 3, user: user_3)

    visit books_path

    expect(page).to have_content("Average Rating: 3")
    expect(page).to have_content("Total Reviews: 3")
  end

  it 'shows the three highest rated books' do
    user_1 = User.create(name: "Bob")
    book_1 = Book.create(title: "Booky books", pages: 123, year_published: 1990, thumbnail: "thumb1")
    book_2 = Book.create(title: "Abby reads", pages: 321, year_published: 1992, thumbnail: "thumb2")
    book_3 = Book.create(title: "Fancy Books", pages: 456, year_published: 1995, thumbnail: "thumb3")
    book_4 = Book.create(title: "Not this one", pages: 654, year_published: 1950, thumbnail: "thumb4")
    review_1 = book_1.reviews.create(title: "Amazing", description: "Really", rating: 5, user: user_1)
    review_2 = book_2.reviews.create(title: "Amazing", description: "Really", rating: 4, user: user_1)
    review_3 = book_3.reviews.create(title: "Amazing", description: "Really", rating: 4, user: user_1)
    review_4 = book_4.reviews.create(title: "Amazing", description: "Really", rating: 1, user: user_1)

    visit books_path

    within '.statistics' do
      expect(page).to have_content('Booky books: 5')
      expect(page).to have_content('Abby reads: 4')
      expect(page).to have_content('Fancy Books: 4')
      expect(page).to_no have_content('Not this one: 1')
    end
  end

  it 'shows the three lowest rated books'

  it 'shows the three users who have written the most reveiws'
end
