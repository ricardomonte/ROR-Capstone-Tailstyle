class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all.order_by_priority
  end

  def show
    category = Category.find(params[:id])
    @article_category = category.articles.order_by_creat
    byebug
  end


end