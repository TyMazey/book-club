require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do

  it 'allows user to fill out a form and create a book, with exsisting author' do
    Author.create(name: 'Rickey Bobby')

    visit new_book_path

    fill_in 'Title', with: 'Talledega Knights'
    fill_in 'Pages', with: '500'
    fill_in 'Year published', with: '2002'
    fill_in 'Thumbnail', with: 'picture.jpg'
    fill_in 'Author', with 'Rickey Bobby'
    click_button 'Save'
    expect(page).to have_content('Talledega Knights')
    expect(page).to have_content('Rickey Bobby')
  end

  it 'allows user to create book with multiple authors' do
    Author.create(name: 'Rickey Bobby')
    Author.create(name: 'Joe Shmoe')

    visit new_book_path

    fill_in 'Title', with: 'Talledega Knights'
    fill_in 'Pages', with: '500'
    fill_in 'Year published', with: '2002'
    fill_in 'Thumbnail', with: 'picture.jpg'
    fill_in 'Author', with: 'Rickey Bobby, Joe Shmoe'
    click_button 'Save'
    expect(page).to have_content('Talledega Knights')
    expect(page).to have_content('Rickey Bobby')
    expect(page).to have_content('Joe Shmoe')
  end

  it 'allows user to create new authors' do

    visit new_book_path

    fill_in 'Title', with: 'Talledega Knights'
    fill_in 'Pages', with: '500'
    fill_in 'Year published', with: '2002'
    fill_in 'Thumbnail', with: 'picture.jpg'
    fill_in 'Author', with: 'Rickey Bobby, Joe Shmoe'
    click_button 'Save'
    expect(page).to have_content('Talledega Knights')
    expect(page).to have_content('Rickey Bobby')
    expect(page).to have_content('Joe Shmoe')
    path_id = Author.where(name: 'Rickey Bobby').id
    click_link ('Rickey Bobby')
    expect(current_path).to eq(author_path(path_id))
  end
end
