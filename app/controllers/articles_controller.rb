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

    if category == 0
      flash[:alert] = 'Article has not been created, missing category'
      redirect_back(fallback_location: root_path)
    elsif @article.save
      @article.category_ids = category
      flash[:notice] = 'Article has been created.'
      redirect_to article_path(@article.id)
    else
      flash[:alert] = @article.errors.full_messages.join('. ')
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @article = Article.find(params[:id])
  end
end
