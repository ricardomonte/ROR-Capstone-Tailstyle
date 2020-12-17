module CategoryHelper
  def display_category_index(element)
    element.each do |category|
      next if category.articles.blank?

      concat content_tag(:div,
                         content_tag(:div,
                                     (image_tag category.articles.first_article.image.url, class: 'card-images'),
                                     class: 'container-image') +
      content_tag(:div, link_title(category), class: 'card-overlay-index'), class: 'card-index')
    end
  end

  def link_title(element)
    content_tag(:h4, (link_to element.name, category_path(element.id), class: 'category-title')) +
      content_tag(:div, content_tag(:p, element.articles.first_article.title, class: 'category-article__title'),
                  class: 'category-article__container')
  end

  def display_category_show2(element, category)
    count = 1
    (0...element.length).each do |article|
      next if element.nil?

      if count.even?
        concat content_tag(:div, content_tag(:div, image_article_show2(element[article], category),
                                             class: 'container-article'), class: 'card-show')
      else
        concat content_tag(:div, content_tag(:div, image_article_show(element[article], category),
                                             class: 'container-article'), class: 'card-show')
      end
      count += 1
    end
  end

  def image_article_show2(element, category)
    content_tag(:div, content_article_show(element, category), class: 'container-info__article') +
      content_tag(:div, (image_tag element.image.url, class: 'image-article'),
                  class: 'container-image__art')
  end

  def image_article_show(element, category)
    content_tag(:div, (image_tag element.image.url, class: 'image-article'),
                class: 'container-image__art') +
      content_tag(:div, content_article_show(element, category), class: 'container-info__article')
  end

  def content_article_show(element, category)
    if signed_in?
      content_tag(:h6, category.name, class: 'category-name') +
      content_tag(:h5, element.title, class: 'article-title') +
      content_tag(:div, content_tag(:p, element.text, class: 'article-text'), class: 'module overflow') +
      content_tag(:p, content_tag(:small, "Author: #{element.user.username}"), class: 'author-article') +
      (link_to '<i class="fas fa-dog fa-3x" style="color: #FF6300;"></i>'.html_safe,
                votes_path(votes: { article_id: element.id }), method: :post, id: 'vote') +
      content_tag(:p, content_tag(:small, 'You can vote for this article clicking in the dog'),
                  class: 'author-article') +
                  content_tag(:p, content_tag(:small, (link_to 'Read  more', article_path(element.id), class: 'link-readmore')),
                  class: 'author-article')
    else
      content_tag(:h6, category.name, class: 'category-name') +
      content_tag(:h5, element.title, class: 'article-title') +
      content_tag(:div, content_tag(:p, element.text, class: 'article-text'), class: 'module overflow') +
      content_tag(:p, content_tag(:small, "Author: #{element.user.username}"), class: 'author-article') +
      content_tag(:p, content_tag(:small, (link_to 'Read  more', article_path(element.id), class: 'link-readmore')),
      class: 'author-article')
    end
  end
                      
  def index_display_all(article)
    unless article.nil?
      render partial: 'index_display', object: article
    end
  end
end

                      
                    