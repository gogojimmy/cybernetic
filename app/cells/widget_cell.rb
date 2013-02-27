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
      @ad = Slider.where(block: "首頁左下區塊").first
    elsif position == "首頁中下區塊"
      @ad = Slider.where(block: "首頁中下區塊").first
    elsif position == "首頁右下區塊"
      @ad = Slider.where(block: "首頁右下區塊").first
    end
    render
  end

  def main_nav
    @categories = Category.roots.to_a
    if I18n.locale != :zh_tw
      @categories = @categories.delete_if { |c| c.title == 'Headset' || c.title == 'Player' }
    end
    @categories = @categories.delete_if { |c| c.title == '未整理' }
    render
  end

  def categories_sidebar
    @categories = Category.roots.to_a
    if I18n.locale != :zh_tw
      @categories = @categories.delete_if { |c| c.title == 'Headset' || c.title == 'Player' }
    end
    @categories = @categories.delete_if { |c| c.title == '未整理' }
    @film = Film.random_film
    film_id = /d\/\S*\"/.match(@film).to_s.delete("d/").delete("\"")
    @thumbnail_image = "http://img.youtube.com/vi/#{film_id}/0.jpg"
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
