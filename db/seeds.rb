#encoding: utf-8

pages = %w( 關於嘉亨 獨立店 3C賣場 生活賣場 網路賣場 產品註冊 聯絡客服 常見問題 下載中心 )
pages.each do |page|
  Page.create(title: page)
end
admin = User.create(email: 'jimmy@gogojimmy.net', password: '0975519929')

first_c = Category.create(title: '手機配件')

Category.create(title: '充電線材', parent_id: first_c)

first_first_c = Category.create(title: '壁充', parent_id: first_c)

Category.create(title: '美規', parent_id: first_first_c)
Category.create(title: '歐規', parent_id: first_first_c)
Category.create(title: '澳規', parent_id: first_first_c)
Category.create(title: '英規', parent_id: first_first_c)

Category.create(title: '車充', parent_id: first_c)
first_second_c = Category.create(title: '行動電源', parent_id: first_c)
Category.create(title: '手機用', parent_id: first_second_c)
Category.create(title: '平板電腦用', parent_id: first_second_c)

first_third_c = Category.create(title: '保護套', parent_id: first_c)
Category.create(title: '手機用', parent_id: first_third_c)
Category.create(title: '平板電腦用', parent_id: first_third_c)

second_c = Category.create(title: '延長線')
second_first_c = Category.create(title: '美規 (110V)', parent_id: second_c)
Category.create(title: '延長線', parent_id: second_first_c)
Category.create(title: '防突波延長線', parent_id: second_first_c)

second_second_c = Category.create(title: '英規(220V)', parent_id: second_c)
Category.create(title: '延長線', parent_id: second_second_c)
Category.create(title: '防突波延長線', parent_id: second_second_c)

second_third_c = Category.create(title: '歐規 (220V)', parent_id: second_c)
Category.create(title: '延長線', parent_id: second_third_c)
Category.create(title: '防突波延長線', parent_id: second_third_c)

second_forth_c = Category.create(title: '義大利適用', parent_id: second_c)
Category.create(title: '延長線', parent_id: second_forth_c)
Category.create(title: '防突波延長線', parent_id: second_forth_c)

second_fifth_c = Category.create(title: '南非適用', parent_id: second_c)
Category.create(title: '延長線', parent_id: second_fifth_c)
Category.create(title: '防突波延長線', parent_id: second_fifth_c)

second_sixth_c = Category.create(title: '澳洲適用', parent_id: second_c)
Category.create(title: '延長線', parent_id: second_sixth_c)
Category.create(title: '防突波延長線', parent_id: second_sixth_c)

second_seventh_c = Category.create(title: '巴西適用', parent_id: second_c)
Category.create(title: '延長線', parent_id: second_seventh_c)
Category.create(title: '防突波延長線', parent_id: second_seventh_c)

second_eighth_c = Category.create(title: '韓國', parent_id: second_c)
Category.create(title: '延長線', parent_id: second_eighth_c)
Category.create(title: '防突波延長線', parent_id: second_eighth_c)

third_c = Category.create(title: '線材')
third_first_c = Category.create(title: 'HDMI', parent_id: third_c)
Category.create(title: '100 series', parent_id: third_first_c)
Category.create(title: '200 series', parent_id: third_first_c)
Category.create(title: '500 series', parent_id: third_first_c)

third_second_c = Category.create(title: 'Audio cable', parent_id: third_c)
Category.create(title: 'Fiber Optic audio cable', parent_id: third_second_c)
Category.create(title: '3.5mm audio cable', parent_id: third_second_c)
Category.create(title: 'Setereo audio cable', parent_id: third_second_c)

third_third_c = Category.create(title: 'Vedio cable', parent_id: third_c)
Category.create(title: '100 series', parent_id: third_third_c)
Category.create(title: '200 series', parent_id: third_third_c)
Category.create(title: '300 series', parent_id: third_third_c)
Category.create(title: '500 series', parent_id: third_third_c)

forth_c = Category.create(title: '遙控器')
forth_first_c = Category.create(title: '萬用遙控器', parent_id: forth_c)
Category.create(title: '二合一', parent_id: forth_first_c)
Category.create(title: '四合一', parent_id: forth_first_c)
Category.create(title: '四合一學習型', parent_id: forth_first_c)
Category.create(title: '八合一', parent_id: forth_first_c)

Category.create(title: '拉丁美洲適用', parent_id: forth_c)

fifth_c = Category.create(title: '數位天線')
fifth_first_c = Category.create(title: '台灣適用', parent_id: fifth_c)
Category.create(title: '插電', parent_id: fifth_first_c)
Category.create(title: '不插電', parent_id: fifth_first_c)

fifth_second_c = Category.create(title: '韓國適用', parent_id: fifth_c)
Category.create(title: '插電', parent_id: fifth_second_c)
Category.create(title: '不插電', parent_id: fifth_second_c)

fifth_third_c = Category.create(title: '泰國適用', parent_id: fifth_c)
Category.create(title: '插電', parent_id: fifth_third_c)
Category.create(title: '不插電', parent_id: fifth_third_c)

fifth_forth_c = Category.create(title: '土耳其適用', parent_id: fifth_c)
Category.create(title: '插電', parent_id: fifth_forth_c)
Category.create(title: '不插電', parent_id: fifth_forth_c)

fifth_fifth_c = Category.create(title: '伊朗適用', parent_id: fifth_c)
Category.create(title: '插電', parent_id: fifth_fifth_c)
Category.create(title: '不插電', parent_id: fifth_fifth_c)

fifth_sixth_c = Category.create(title: '俄國適用', parent_id: fifth_c)
Category.create(title: '插電', parent_id: fifth_sixth_c)
Category.create(title: '不插電', parent_id: fifth_sixth_c)

sixth_c = Category.create(title: '清潔液')
Category.create(title: '螢幕清潔液', parent_id: sixth_c)
Category.create(title: '磁頭清潔片', parent_id: sixth_c)

seventh_c = Category.create(title: '消費性電池及充電器')
Category.create(title: '碳鋅電池', parent_id: seventh_c)
Category.create(title: '鹼性電池', parent_id: seventh_c)
Category.create(title: '高效能鹼性電池', parent_id: seventh_c)
Category.create(title: 'Ultra 鋰電池', parent_id: seventh_c)
Category.create(title: '鈕扣電池', parent_id: seventh_c)
Category.create(title: '充電電池', parent_id: seventh_c)
Category.create(title: '電池充電器', parent_id: seventh_c)

media_c = Category.create(title: '儲存媒體 ')
Category.create(title: '隨身碟', parent_id: media_c)
Category.create(title: '記憶卡 ', parent_id: media_c)
Category.create(title: '固態硬碟(SSD)', parent_id: media_c)
Category.create(title: '光碟片', parent_id: media_c)

eighth_c = Category.create(title: '耳機')
Category.create(title: '耳罩式耳機', parent_id: eighth_c)
Category.create(title: '輕量化耳罩式耳機', parent_id: eighth_c)
Category.create(title: '耳塞式/入耳式耳機', parent_id: eighth_c)
Category.create(title: '運動型耳機', parent_id: eighth_c)
Category.create(title: '手機用耳機麥克風', parent_id: eighth_c)
Category.create(title: '電腦式耳機麥克風', parent_id: eighth_c)

nineth = Category.create(title: '行動影音播放器 ')
Category.create(title: 'MP3', parent_id: nineth)
Category.create(title: 'MP4', parent_id: nineth)

tenth = Category.create(title: 'LED 手電筒')
Category.create(title: '迷你系列', parent_id: tenth)
Category.create(title: '家用系列', parent_id: tenth)
Category.create(title: '戶外使用系列', parent_id: tenth)
