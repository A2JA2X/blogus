class ArticlesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.page(params[:page]).per(5).order("created_at DESC")
  end

  def show
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    redirect_to_msg("新しい記事が投稿されました。")
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to_msg("記事が編集されました。")
  end

  def destroy
    @article.destroy
    redirect_to_msg("記事が削除されました。")
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, :img_url).merge(user_id: current_user.id)
  end

  def redirect_to_msg(msg)
    redirect_to ({ controller: :users, action: :show, id: current_user.id }), notice: msg
  end

  def set_article
    @article= Article.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
