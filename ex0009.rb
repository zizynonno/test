num = 0

#fileクラスのopenメソッドではopenしたファイルの処理内容をブロックとして渡すことができる。
#before-> flie.open("sample1.txt","r:UTF-8")
open("sample1.txt","r:UTF-8") {|file|
  file.each{|line|
    num += 1
    puts("#{num}： #{line}")
  }
}

