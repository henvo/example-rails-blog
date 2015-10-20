class ArticlesController < ApplicationController

  def new
  end

  def create
    @article = Article.new(params[:article].permit(:title, :text))
    @article.save
    redirect_to @article
  end

  def show
  end
end
