module CategoryHelper
  
  def display_category_index(element)
    element.each do | category |
      unless category.articles.blank?
        concat content_tag(:div, content_tag(:div, (image_tag category.articles.first_article.image.url, class: 'h-100 w-100', style: 'object-fit: cover;'), class:'card-image', style: 'width: 464px; height: 300px; over-flow: hide;') +
              content_tag(:div, link_title(category), class: "card-img-overlay", style: 'width: 464px;'), class: "card", style:'height: 300px border: 0; background-color: #4E443E;')
      end
    end
  end

  def link_title(element)
    content_tag(:h4,(link_to element.name, category_path(element.id), class: 'card-link font-weight-bolder', style:"color: #FA6000") , class: "card-title") +
    content_tag(:div, content_tag(:p, element.articles.first_article.title, class: "card-text text-white font-weight-bolder text-center"), class: "h-75 d-flex justify-content-end align-items-end") 
  end

  def display_category_show(element, category)
    element.each do | article |  
      unless article.nil?
        concat content_tag(:div, content_tag(:div, image_article_show(article, category),
                          class: "card-body pt-0 pr-0 pl-0", style: 'width: 338px;'), class: 'card') 
      else
        concat content_tag(:div, content_tag(:div, image_article_show2(category),
                          class: "card-body pt-0 pr-0 pl-0", style: 'width: 338px;'), class: 'card')
      end
    end
  end

  def image_article_show(element, category)
    content_tag(:div, (image_tag element.image.url, class: 'h-100 w-100', style: 'object-fit: cover;'),
              class: "card-img-top pb-2",  style: 'height: 225px; over-flow: hide;') +
    content_tag(:div, content_article_show(element, category) , class: "pl-2")
    
  end

  def content_article_show(element, category)
    content_tag(:h6, category.name, class: "card-title font-weight-bolder", style: "color: #FA6000;") +
    content_tag(:h5, element.title, class: "card-subtitle mb-2 font-weight-bolder") +
    content_tag(:p, element.text, class: "card-subtitle mb-2 font-weight-bolder") +
    (link_to "Author: #{element.user.username}", article_path(element.id))
  end

  def image_article_show2(element, category)
    content_tag(:div, class: "card-img-top pb-2",  style: 'width: 338px; height: 225px; over-flow: hide;') +
    content_tag(:div, content_article_show2(category) , class: "pl-2")
    
  end

  def content_article_show2(element, category)
    content_tag(:h6, category.name, class: "card-title font-weight-bolder", style: "color: #FA6000;") +
    content_tag(:h5, 'No article has been created', class: "card-subtitle mb-2 font-weight-bolder") +
    (link_to 'Create an article', new_article_path)
  end
end


