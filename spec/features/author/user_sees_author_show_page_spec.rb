require 'rails_helper'

RSpec.describe 'as visitor', type: :feature do

  it 'shows information about an author' do
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

    expect(current_path).to eq book_path(book_1)
    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_1.year_published)

    expect(page).to_not have_content(book_2.title)
  end

  it 'shows the top review for the author' do
    author = Author.create(name: "bob")
    book = author.books.create(title: "book 1", pages: 100, year_published: 1901, thumbnail: "picture url")
    user = User.create(name: 'Bob')
    user_1 = User.create(name: 'Jeef')
    book.reviews.create(title: 'Great', description: 'great', rating: 5, user: user)
    book.reviews.create(title: 'Bad', description: 'bad', rating: 1, user: user_1)

    visit author_path(author.id)

    within '#best-review' do
      expect(page).to have_content('Great')
      expect(page).to have_content('Bob')
      expect(page).to_not have_content('Bad')
      expect(page).to_not have_content('Jeef')
    end
  end

  it 'shows the user if no review has been made on a book for author' do
    author = Author.create(name: "bob")
    book = author.books.create(title: "book 1", pages: 100, year_published: 1901, thumbnail: "picture url")

    visit author_path(author.id)

    within '#best-review' do
      expect(page).to have_content('No Reviews Yet')
    end
  end
end
