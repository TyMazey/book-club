require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do

  it 'it shows me a link for the home page' do

    visit '/'

    expect(page).to have_link('Home')

    click_on('Home')

    expect(current_path).to eq('/')
  end

  it 'it shows me links for book index' do

    visit '/'

    expect(page).to have_link('Shelf')

    click_on('Shelf')

    expect(current_path).to eq('/books')
  end

end
