class AuthorsController < ApplicationController

  def show
    @author = Author.find(params[:id])
    @books = @author.books
    @best_review = @author.best_review
  end
end
