require 'rails_helper'

RSpec.describe Author, type: :model do

  describe 'relationship' do
    it {should have_many :author_books}
    it {should have_many(:books).through :author_books}
  end

  describe 'validations' do

    it {should validate_presence_of :name}
  end

  describe 'instance methods' do

  end
end
