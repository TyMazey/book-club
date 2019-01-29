class AuthorsController < ApplicationController

  def show
    @author = Author.find(params[:id])
    @books = @author.books
    @best_review = @author.best_review
  end

  def destroy
    @books = AuthorBook.where(author_id: params[:id]).pluck(:book_id)
    Book.destroy(@books)
    AuthorBook.where(book_id: @books).destroy_all

    redirect_to books_path
  end
end
