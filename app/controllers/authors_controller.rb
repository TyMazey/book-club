class AuthorsController < ApplicationController

  def show
    @author = Author.find(params[:id])
    @books = @author.books
  end

  def destroy
    books = AuthorBook.where(author_id: params[:id]).pluck(:book_id)
    Book.destroy(books)
    AuthorBook.where(book_id: books).destroy_all
    Author.find(params[:id]).destroy
    redirect_to books_path
  end
end
