require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do

  it 'allows user to fill out a form and create a book' do
    Author.create(name: 'Rickey Bobby')

    visit book_path

    fill_in 'Title', with: 'John'
    fill_in 'Pages', with: 'John'
    fill_in 'Year Published', with: 'John'
    fill_in 'Book Cover', with: 'John'
    select 'Rickey Bobby', from: 'Authors'
    click_button 'Save Book'
    expect(current_path).to eq(book())
  end
end
