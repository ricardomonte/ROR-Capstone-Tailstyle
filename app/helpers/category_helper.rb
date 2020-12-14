module CategoryHelper
  
  def display_category_index(element)
    element.each do | category |
      unless category.articles.blank?
        concat content_tag(:div, content_tag(:div, (image_tag category.articles.first_article.image.url, class: 'card-images'), class:'container-image') +
              content_tag(:div, link_title(category), class: "card-overlay-index"), class: "card-index")
      end
    end
  end

  def link_title(element)
    content_tag(:h4, (link_to element.name, category_path(element.id), class: 'category-title')) +
    content_tag(:div, content_tag(:p, element.articles.first_article.title, class: "category-article__title"), class: "category-article__container") 
  end

  def display_category_show(element, category)
    element.each do | article |  
      unless article.nil?
        concat content_tag(:div, content_tag(:div, image_article_show(article, category),
                          class: 'container-article'), class: 'card') 
      end
    end
  end

  def image_article_show(element, category)
    content_tag(:div, (image_tag element.image.url, class: 'image-article'),
              class: 'container-image__art') +
    content_tag(:div, content_article_show(element, category) , class: "pl-2")
    
  end

  def content_article_show(element, category)
    if signed_in?
      content_tag(:h6, category.name, class: "category-name") +
      content_tag(:h5, element.title, class: "article-title") +
      content_tag(:div, content_tag(:p, element.text, class: "article-text"), class: "module overflow") +
      content_tag(:p, content_tag(:small, "Author: #{element.user.username}"), class: 'author-article') +
      (link_to '<i class="fas fa-dog fa-3x" style="color: #FF6300;"></i>'.html_safe, votes_path(votes: { article_id: element.id }), method: :post, id: "vote") +
      content_tag(:p, content_tag(:small, 'You can vote for this article clicking in the dog'), class: 'text-muted font-italic')
    else
      content_tag(:h6, category.name, class: "category-name") +
      content_tag(:h5, element.title, class: "article-title") +
      content_tag(:div, content_tag(:p, element.text, class: "article-text"), class: "module overflow") +
      content_tag(:p, content_tag(:small, "Author: #{element.user.username}"), class: 'author-article')
    end
  end
end


