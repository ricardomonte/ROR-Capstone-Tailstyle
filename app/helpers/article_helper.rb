module ArticleHelper
  def display_category_name(article)
    article.each do |category|
      concat content_tag(:h6, category.name, class: 'card-subtitle mb-2 text-muted')
    end
  end
end
