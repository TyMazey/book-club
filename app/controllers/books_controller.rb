class BooksController < ApplicationController

  def index
    @books = Book.all
    @best_books = Book.best_books
    @worst_books = Book.worst_books
    @user_reviews = User.top_review_users
  end

  def show
    @book = Book.find(params[:id])
  end
end
