class ArticlesController < ApplicationController
  def index
    @articles = Article.includes(:user).all
  end

  def new
    @article = Article.new
    @category = Category.all
  end

  def create
    @article = current_user.articles.build(params_article)
    if @article.category_ids.empty?
      flash[:alert] = 'Article has not been created, missing category'
      redirect_back(fallback_location: root_path)
    elsif @article.save
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

  private

  def params_article
    params.require(:article).permit(:title, :text, :image, :category_ids => [])

  end
end
