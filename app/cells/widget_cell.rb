#encoding: utf-8
class WidgetCell < Cell::Rails
  helper ApplicationHelper

  def news_sidebar
    @news = Post.news.last(5)
    render
  end

  def on_sale_sidebar
    @on_sales = Post.on_sale.last(5)
    render
  end

  def block_ad(position)
    if position == "首頁左下區塊"
      @ad = Slider.where(position: "首頁左下區塊").first
    elsif position == "首頁中下區塊"
      @ad = Slider.where(position: "首頁中下區塊").first
    elsif position == "首頁右下區塊"
      @ad = Slider.where(position: "首頁右下區塊").first
    end
    render
  end

  def main_nav
    if I18n.locale == :zh_tw
      @categories = Category.roots
    else
      @categories = Category.roots.to_a
      @categories = @categories.delete_if { |c| c.title == '耳機' || c.title == '行動影音播放器' }
    end
    render
  end

  def categories_sidebar
    if I18n.locale == :zh_tw
      @categories = Category.roots
    else
      @categories = Category.roots.to_a
      @categories = @categories.delete_if { |c| c.title == '耳機' }
      @categories = @categories.delete_if { |c| c.title == '耳機' || c.title == '行動影音播放器' }
    end
    render
  end

  def categories_ads(categories)
    @categories = categories
    render
  end

  def marketing_footer
    @marketing = Marketing.new
    render
  end

  def welcome_news
    @news = Post.news.last(10)
    render
  end

end
