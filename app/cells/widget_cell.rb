#encoding: utf-8
class WidgetCell < Cell::Rails

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
    @categories = Category.roots
    render
  end

  def categories_sidebar
    @categories = Category.roots
    render
  end

  def categories_ads(categories)
    @categories = categories
    render
  end

end
