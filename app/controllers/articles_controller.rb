class ArticlesController < ApplicationController
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
    # todo: ユーザID必須のため新規投稿時エラー発生する。develop Gemをインストールする
    # todo: ユーザ周りの作業の際に行う
    Article.create(title: article_params[:title], content: article_params[:content], img_url: article_params[:img_url], user_id: 1)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    # todo: 現状では誰でも編集可能になってしまっている。投稿したユーザだけが編集できるようにする
    # ユーザ周りの作業の際に行う
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
end
