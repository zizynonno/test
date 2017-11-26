fruits = ["apple","banana","chelly","fig","grape"]

#"sample4.txt"を書き込みモード(w:UTL-8)で新規作成
#フルーツ配列をファイルに書き込み。
file = File::open("sample4.txt","w:UTF-8")
fruits.each{|fruit|
  file.puts fruit
}

file.close

file = open("sample4.txt","r:UTF-8")

#ファイルからデータをすべて読み込み、それを表示
print file.read

file.close

