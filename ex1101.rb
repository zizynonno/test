friends = {
    :shin => "shin kuboaki",
    :shinichirou => "shinichirou ooba",
    :shingo => "shingo katori"
}

#ハッシュのキーを1つずつ処理する
#繰り返しの度、キーをブロック内のローカル変数keyに渡す
friends.each_key { |key|
  #ローカル変数(キー)の値を表示する
  puts "#{key}"
}