#PStoreを使う時は、ライブラリPStoreを書き込んでおきます
require 'pstore'

#文字列を作成
juice = "orange juice"
#配列にデータを作成
fruits = ["apple","banana","cherry","fig","grape"]

#PStoreでデータベースを作成する
db = PStore.new('fruitdb')

#PStoreにデータを書き込む
db.transaction do
  #文字列をPStoreに保存する
  db["drink"] = juice
  db["fruits"] = fruits
end

db.transaction(true) do
  puts "drink: #{db["drink"]}"
  puts "fruits: #{db["fruits"].join(",")}"
end