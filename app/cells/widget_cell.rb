class WidgetCell < Cell::Rails

  def news_sidebar
    @news = Post.news.last(5)
    render
  end

  def on_sale_sidebar
    @on_sales = Post.on_sale.last(5)
    render
  end

end
