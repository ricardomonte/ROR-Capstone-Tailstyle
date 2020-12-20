module ArticleHelper
  def display_category_name(article)
    article.each do |category|
      concat content_tag(:h6, category.name, class: 'card-subtitle mb-2 text-muted')
    end
  end

  def display_form_new
    if signed_in?
      render partial: 'newform'
    else
      render partial: 'problem'
    end
  end
end
