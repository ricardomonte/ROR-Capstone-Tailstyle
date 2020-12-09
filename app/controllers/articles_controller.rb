class ArticlesController < ApplicationController

  def index
    @articles = Article.includes(:user).all
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    @article = current_user.articles.build(title: params[:article][:title], text: params[:article][:text], image: params[:article][:image])
    category = params[:article][:categories].to_i
    if @article.save
      @article.category_ids = category
      flash[:notice] = 'Article has been created.'
      redirect_to root_path
    else
      render :new
    end
  end
end