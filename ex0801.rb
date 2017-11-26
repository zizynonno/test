require 'date'

# 表示したい蔵書データを作成する
title = "実践アジャイル　ソフトウェア開発法とプロジェクト管理"
author = "山田　正樹"
yomi = "やまだまさき"
publisher  = "ソフトリサーチセンター"
page = 248
price =2500
tax = 0.08
purchace_price = price*(1+tax)
publish_date = Date.new(2005, 1 , 25)
purchace_date = Date.new(2005, 3 , 15)

# 蔵書データを表示する
puts "書籍名　：" + title
puts "著者名　：" + author
puts "よみがな：" + yomi
puts "出版社　：" + publisher
puts "ページ数：" + page.to_s
puts"本体価格："+ price.to_s
puts"購入費用："+ purchace_price.to_s
puts"出版年："+ publish_date.year.to_s
puts"出版月："+publish_date.mon.to_s
puts"購入日"+purchace_date.to_s

