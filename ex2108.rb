require 'rubygems'
require 'dbi'

dbh = DBI.connect('DBI:SQLite3:fruits01.db')

#テーブルにデータを追加する
dbh.do("insert into products values(
1,
'りんご',
'別名「雪の下」と呼ばれる国光です',
'/image/kokkou.jpg',
'300',
'2009-03-20 00:00:00'
);")


dbh.do("insert into products values(
2,
'マンゴー',
'宮崎名産「太陽のたまご」です',
'/image/mango.jpg',
'2000',
'2009-03-20 00:00:00'
);")

puts "2 records inserted."

dbh.disconnect
