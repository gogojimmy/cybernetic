#encoding: utf-8
module ApplicationHelper
  def is_zh_tw?
    I18n.locale == :zh_tw
  end

  def show_admin_product_link(product)
    if product.category.nil?
      product.category = Category.find_by_title("未整理")
      product.save
    end
    link_to(product.category.try(:title), admin_category_path(product.category))
  end
end
