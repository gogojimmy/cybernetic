#encoding: utf-8

pages = %w( 關於嘉亨 獨立店 3C賣場 生活賣場 網路賣場 產品註冊 聯絡客服 常見問題 下載中心 )
pages.each do |page|
  Page.create(title: page, updated_at: Time.now)
end
