class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if params[:sort] != nil
      @reviews = @user.reviews.sort_reviews(params[:sort])
    else
      @reviews = @user.reviews
    end
  end

end
