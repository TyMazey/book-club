require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do

  it 'allows user to fill out a form and create a book, with exsisting author' do
    Author.create(name: 'Rickey Bobby')

    visit new_book_path

    fill_in 'Title', with: 'Talledega Knights'
    fill_in 'Pages', with: '500'
    fill_in 'Year published', with: '2002'
    fill_in 'Thumbnail', with: 'picture.jpg'
    fill_in 'Authors', with: 'Rickey Bobby'
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
    fill_in 'Authors', with: 'Rickey Bobby, Joe Shmoe'
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
    fill_in 'Authors', with: 'Rickey Bobby, Joe Shmoe'
    click_button 'Save'
    expect(page).to have_content('Talledega Knights')
    expect(page).to have_content('Rickey Bobby')
    expect(page).to have_content('Joe Shmoe')
    Author.where(name: 'Rickey Bobby')
    Author.where(name: 'Joe Shmoe')
  end

  it 'gives a default image for the cover if none is given' do
    visit new_book_path

    fill_in 'Title', with: 'Talledega Knights'
    fill_in 'Pages', with: '500'
    fill_in 'Year published', with: '2002'
    fill_in 'Authors', with: 'Rickey Bobby, Joe Shmoe'
    click_button 'Save'

    expect(page).to have_xpath("//img[@src='https://www.mobileread.com/forums/attachment.php?attachmentid=111264&d=1378642555']")
    expect(page).to have_content('Rickey Bobby')
    expect(page).to have_content('Joe Shmoe')
    Author.where(name: 'Rickey Bobby')
    Author.where(name: 'Joe Shmoe')
  end
end
