class ArticlesController < ApplicationController

  def index
    @articles = Article.includes(:user).all
  end
end