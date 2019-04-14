class UsersController < ApplicationController
  def show
    if user_signed_in?
      @user = User.find(current_user.id)
    else
      @user = User.find(params[:id])
    end
    @articles = @user.articles.order('updated_at DESC')
  end
end
