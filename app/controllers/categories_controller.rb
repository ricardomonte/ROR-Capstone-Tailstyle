class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order_by_priority
    @article = if favorite_article.nil?
                 Article.first
               else
                 Article.find(favorite_article)
               end
  end

  def show
    @category = Category.find(params[:id]).includes(:article)
    @article_category = @category.articles.order_by_creat.limit(8)
  end

  private

  def favorite_article
    Vote.favorite.keys.first
  end
end
