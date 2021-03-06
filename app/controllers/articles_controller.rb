class ArticlesController < ApplicationController

  def index
    @articles = Article.all.reverse
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params) ? (redirect_to @article) : (render 'new')
  end

  def create
    @article = Article.new(article_params)
    @article.save ? (redirect_to @article) : (render 'new')
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
