# -*- encoding : utf-8 -*-
module CategoriesHelper

  def nested_categories(categories)
    categories.map do |category, sub_categories|
      render(category) + content_tag(:div, nested_categories(sub_categories), class: "nested_categories")
    end.join.html_safe
  end

  def suckerfish(categories)
	  categories.map do |category, sub_category|
	  	  content_tag :li, :id => dom_id(category), :class => cycle('odd', 'even') do
	  	  	render(category) + (content_tag(:ul, suckerfish(sub_category), class: 'unstyle sortable', data: { "update_url" => sort_admin_categories_url }) if sub_category.present?)
	  	  end
	  end.join.html_safe
	end

end
