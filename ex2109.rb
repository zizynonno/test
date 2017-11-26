require 'rubygems'
require 'dbi'

#データベース'fruits01.db'に接続する
dbh = DBI.connect('DBI:SQLite3:fruits01.db')

#テーブルからデータを読み込んで表示する
sth = dbh.execute("select * from products")

#select文の実行結果を1件ずつrowに取り出し、繰り返し処理する
sth.each{|row|
row.each_with_name {|val,name|
  puts "#{name}: #{val.to_s}"
}
  puts "-----------------------"
}

sth.finish

dbh.disconnect