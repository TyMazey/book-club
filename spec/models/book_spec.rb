require 'rails_helper'

RSpec.describe Book, type: :model do

  describe 'relationships' do

    it {should have_many :author_books}
    it {should have_many(:authors).through :author_books}
  end

  describe 'validations' do

    it {should validate_presence_of :title}
    it {should validate_presence_of :pages}
    it {should validate_presence_of :year_published}
  end

  describe 'instance methods' do
  end
end
