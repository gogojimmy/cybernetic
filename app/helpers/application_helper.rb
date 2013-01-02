module ApplicationHelper
  def is_zh_tw?
    I18n.locale == :zh_tw
  end
end
