require 'rails_helper'

RSpec.describe 'as visitor', type: :feature do

  it "allows user to fill out a new review" do
    author = Author.create(name: 'bob')
    book = author.books.create(title: 'new', pages: 500, year_published: 1999, thumbnail: 'picture.url')

    visit new_book_review_path(book.id)

    fill_in  'Title', with: 'Great Book'
    fill_in  'Description', with: 'Really enjoyed it.'
    fill_in  'Rating', with: '5'
    fill_in  'User', with: 'Ty'
    click_button 'Save'

    expect(current_path).to eq(book_path(book.id))
    expect(page).to have_content('Great Book')
  end
end
