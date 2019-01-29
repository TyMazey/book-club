require 'rails_helper'


RSpec.describe Review, type: :model do

  describe 'relationships' do

    it {should belong_to :book}
  end

  describe 'validations' do
    it {should validates_presence_of :title}
    it {should validates_presence_of :description}
    it {should validates_presence_of :rating}
    it {should validates_presence_of :user}
  end

  describe 'class methods' do
  end

  describe 'instance methods' do
  end

end
