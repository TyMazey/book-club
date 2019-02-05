
class BooksController < ApplicationController

  def index
    @books = Book.sort_by(params[:sort])
    @best_books = Book.best_books
    @worst_books = Book.worst_books
    @user_reviews = User.top_review_users
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @authors = Author.all
  end

  def create
    names = params[:book][:authors].split(',')
    authors = names.map {|name| Author.find_or_create_by(name: name.titlecase)}
    @book = Book.new(book_params)
    if @book.thumbnail == ''
      @book.update(thumbnail: 'https://www.mobileread.com/forums/attachment.php?attachmentid=111264&d=1378642555')
    end
    @book.update(authors: authors)
    @book.update(title: @book.title.titlecase)
    @book.save
    redirect_to book_path(@book.id)
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :pages, :year_published, :thumbnail)
  end
end
