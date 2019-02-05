class ReviewsController < ApplicationController

  def new
    book = Book.find(params[:book_id])
    @review = book.reviews.new
    @book = params[:book_id]
  end

  def create
    user = User.find_or_create_by(name: params[:review][:user].titlecase)
    book = Book.find(params[:book_id].titlecase)
    @review = book.reviews.new(review_params)
    @review.update(user: user)
    @review.save
    redirect_to book_path(params[:book_id])
  end

  def destroy
    Review.destroy(params[:id])
    redirect_to user_path(params[:user])
  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :rating)
  end
end
