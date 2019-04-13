class UsersController < ApplicationController
  def show
    @articles = Article.where(user_id: current_user.id).order('updated_at DESC')
  end
end
