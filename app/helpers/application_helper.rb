module ApplicationHelper
  def nav_list
    category = Category.all
    category.each do |cat|
      concat content_tag(:li, (link_to cat.name, category_path(cat.id), class: 'nav-link'), class: 'nav-item')
    end
  end
end
