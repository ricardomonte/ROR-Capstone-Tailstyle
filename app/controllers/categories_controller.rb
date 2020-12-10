class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all.order_by_priority
    @article = Article.find(favorite_article)
  end

  def show
    category = Category.find(params[:id])
    @article_category = category.articles.order_by_creat
  end

  private

  def favorite_article
    Vote.favorite.keys.first
  end


end