class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.where(id: params[:id]).first
  end
end
