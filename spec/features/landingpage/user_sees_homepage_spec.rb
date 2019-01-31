require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do

  it 'it shows me a link for the home page' do

    visit root_path

    expect(page).to have_link('Home')

    click_on('Home')

    expect(current_path).to eq(root_path)
  end

  it 'it shows me links for book index' do

    visit root_path

    expect(page).to have_link('Shelf')

    click_on('Shelf')

    expect(current_path).to eq(books_path)
  end

end
