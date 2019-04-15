class ArticlesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @articles = Article.page(params[:page]).per(5).order("created_at DESC")
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(title: article_params[:title], content: article_params[:content], img_url: article_params[:img_url], user_id: current_user.id)
    redirect_to ({ controller: :users, action: :show, id: current_user.id }), notice: "新しい記事が投稿されました。"
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(title: article_params[:title], content: article_params[:content], img_url: article_params[:img_url])
    redirect_to ({ controller: :users, action: :show, id: current_user.id }), notice: "記事が編集されました。"
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to ({ controller: :users, action: :show, id: current_user.id }), notice: "記事が削除されました。"
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, :img_url)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
