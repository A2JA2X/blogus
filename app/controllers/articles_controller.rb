class ArticlesController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(title: article_params[:title], content: article_params[:content], img_url: article_params[:img_url], user_id: current_user.id)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(title: article_params[:title], content: article_params[:content], img_url: article_params[:img_url])
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, :img_url)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
