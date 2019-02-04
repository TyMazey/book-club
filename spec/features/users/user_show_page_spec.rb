require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do

  describe 'when i visit a users page' do
    it 'shows me the users name and any reviews they have made' do
      user = User.create(name: 'Bobby')
      author = Author.create(name: 'Author')
      book_1 = author.books.create(title: 'book', pages: 200, year_published: 1012, )
      book_2 = author.books.create(title: 'book 2', pages: 300, year_published: 2019, )
      review_1 = book_1.reviews.create(title: 'good', description: 'aight', rating: 3, book_id: book_2.id, user_id: user.id)
      review_2 = book_2.reviews.create(title: 'better', description: 'yay', rating: 4, book_id: book_1.id, user_id: user.id)

      visit user_path(user.id)

      expect(page).to have_content('Bobby')
      within '.reviews' do
        expect(page).to have_content('good')
        expect(page).to have_content('aight')
        expect(page).to have_content('3')
        expect(page).to have_content('better')
        expect(page).to have_content('yay')
        expect(page).to have_content('4')
      end
    end

    it 'shows links for sorting the reviews' do
      user = User.create(name: 'Bobby')
      author = Author.create(name: 'Author')
      book_1 = author.books.create(title: 'book', pages: 200, year_published: 1012, )
      book_2 = author.books.create(title: 'book 2', pages: 300, year_published: 2019, )
      review_1 = book_1.reviews.create(title: 'good', description: 'aight', rating: 3, book_id: book_2.id, user_id: user.id)
      review_2 = book_2.reviews.create(title: 'better', description: 'yay', rating: 4, book_id: book_1.id, user_id: user.id)

      visit user_path(user.id)
      click_link 'Newest Reviews'

      within '.reviews' do
        expect(page.all('#single-review')[0]).to have_content('better')
        expect(page.all('#single-review')[1]).to have_content('good')
      end

      visit user_path(user.id)
      click_link 'Oldest Reviews'

      within '.reviews' do
        expect(page.all('#single-review')[0]).to have_content('good')
        expect(page.all('#single-review')[1]).to have_content('better')
      end
    end
  end
end
