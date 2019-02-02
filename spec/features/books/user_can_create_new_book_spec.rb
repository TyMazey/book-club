require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do

  it 'allows user to fill out a form and create a book' do
    Author.create(name: 'Rickey Bobby')

    visit new_book_path

    fill_in 'Title', with: 'Talledega Knights'
    fill_in 'Pages', with: '500'
    fill_in 'Year published', with: '2002'
    fill_in 'Thumbnail', with: 'picture.jpg'
    select 'Rickey Bobby', from: 'Authors'
    click_button 'Save'
    expect(page).to have_content('Talledega Knights')
  end
end
