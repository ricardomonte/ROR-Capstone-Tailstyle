class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all.order_by_priority
  end
end