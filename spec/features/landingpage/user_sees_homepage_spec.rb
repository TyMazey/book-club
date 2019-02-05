require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do

  it 'it shows me links for book index' do

    visit root_path

    expect(page).to have_link('View the Shelf')

    click_on('View the Shelf')

    expect(current_path).to eq(books_path)
  end

end
