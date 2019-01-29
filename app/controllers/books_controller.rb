class BooksController < ApplicationController

  def index
    @books = Book.all
    @best_books = Book.best_books
  end

  def show
    @book = Book.find(params[:id])
  end
end
