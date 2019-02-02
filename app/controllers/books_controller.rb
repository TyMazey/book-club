
class BooksController < ApplicationController

  def index
    @books = Book.sort_by(params[:sort])
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end
end
