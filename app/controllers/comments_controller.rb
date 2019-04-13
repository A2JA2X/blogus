class CommentsController < ApplicationController

  def create
    Comment.create(create_params)
    redirect_to controller: :articles, action: :show, id: params[:article_id]
  end

  def create_params
    params.require(:comment).permit(:comment_content).merge(article_id: params[:article_id], user_id: current_user.id)
  end
end
