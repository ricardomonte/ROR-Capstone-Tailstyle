class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all.order_by_priority
    if favorite_article.nil?
      @article = Article.first
    else
      @article = Article.find(favorite_article)
    end
    
  end

  def show
    @category = Category.find(params[:id])
    @article_category = @category.articles.order_by_creat.limit(3)
  end

  private

  def favorite_article
    Vote.favorite.keys.first
  end


end