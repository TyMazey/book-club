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

  it 'can select links to sort the books' do
    author = Author.create(name: "Rickey Bobby")
    book_1 = Book.create(title: "Moby Dick", pages: 100, year_published: 1900, thumbnail: "gibberish", authors: [author])
    book_2 = Book.create(title: "Sobby Rick", pages: 200, year_published: 1900, thumbnail: "gibberish", authors: [author])
    user_1 = User.create(name: "bob")
    user_2 = User.create(name: "rob")
    user_3 = User.create(name: "tod")
    book_1.reviews.create(title: "Amazing", description: "Really", rating: 5, user: user_1)
    book_1.reviews.create(title: "Amazing", description: "Really", rating: 1, user: user_2)
    book_1.reviews.create(title: "Amazing", description: "Really", rating: 3, user: user_3)
    book_2.reviews.create(title: "Amazing", description: "Really", rating: 5, user: user_1)
    book_2.reviews.create(title: "Amazing", description: "Really", rating: 4, user: user_2)

    visit books_path
    click_on 'Highest Rated'

    expect(page.all('.merchant')[0]).to have_content('Sobby Rick')
    expect(page.all('.merchant')[1]).to have_content('Moby Dick')

    visit books_path
    click_on 'Lowest Rating'

    expect(page.all('.merchant')[1]).to have_content('Moby Dick')
    expect(page.all('.merchant')[0]).to have_content('Sobby Rick')

    visit books_path
    click_on 'Most Pages'

    expect(page.all('.merchant')[0]).to have_content('Sobby Rick')
    expect(page.all('.merchant')[1]).to have_content('Moby Dick')

    visit books_path
    click_on 'Least Pages'

    expect(page.all('.merchant')[1]).to have_content('Moby Dick')
    expect(page.all('.merchant')[0]).to have_content('Sobby Rick')

    visit books_path
    click_on 'Most Reviews'

    expect(page.all('.merchant')[1]).to have_content('Moby Dick')
    expect(page.all('.merchant')[0]).to have_content('Sobby Rick')

    visit books_path
    click_on 'Least Reviews'

    expect(page.all('.merchant')[0]).to have_content('Sobby Rick')
    expect(page.all('.merchant')[1]).to have_content('Moby Dick')
  end
end
