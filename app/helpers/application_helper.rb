module ApplicationHelper
  def nav_list
    category = Category.all
    category.each do |cat|
      concat content_tag(:li, (link_to cat.name, category_path(cat.id), class: 'nav-link'), class: 'nav-item')
    end
  end

  def w_article
    render partial: 'layouts/write_article' if signed_in?
  end

  def login_logout
    if signed_in?
      render partial: 'layouts/login'
    else
      render partial: 'layouts/logout'
    end
  end

  def display_vote
    render partial: 'articles/vote' if signed_in?
  end
end
