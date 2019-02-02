
class BooksController < ApplicationController

  def index
    @books = Book.sort_by(params[:sort])
  end

  def show
    @book = Book.find(params[:id])
  end
end
