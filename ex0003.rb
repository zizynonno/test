#新しいハッシュを作る
friends = {
    :shin => "shin hirashima",
    :yume => "yume yuuki",
    }

#ハッシュに要素を追加する
friends[ :jiro] = "jiro yamabuki"

puts friends.include?( :shin)
puts friends[:shin]

#ハッシュの要素を削除する
friends.delete(:shin)

#ハッシュの要素を検索
if friends.include?( :shin) then
  puts friends[:shin]
else
  puts "見つかりません"
end

#ハッシュの要素を１つずつ処理する
#繰り返しの都度、キーと値をブロック内のローカル変数keyとvalueに渡す

friends.each{ |key, value|
  # ローカル変数の値を表示する
  puts "#{key} #{value}"
}

p 100