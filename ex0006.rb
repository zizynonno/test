require 'date'

class Bookinfo
  #Bookinfoクラスのインスタンスを初期化する(インスタンス変数-実物変数を作る)
  def initialize(title,author,page,publish_date)
    @title = title
    @author = author
    @page = page
    @publish_date = publish_date
  end

  #最初に検討する属性に対するアクセサを提供する(属性(インスタンス変数)の個別参照、変更ができるようになる)
  attr_accessor :title,:author,:page, :publish_date

  #CSV形式へ変換する(カンマ区切りの改行付き文字列を作る)
  def to_csv(key)
    "#{key},#{@title},#{@author},#{@page},#{@publish_date}\n"
  end

  #Bookinfoクラスのインスタンスの文字列表現を返す(マナー)
  def to_s
    "#{@title},#{@author},#{@page},#{@publish_date}"
  end

  #　蔵書データを書式をつけて出力する操作を追加する
  #　項目の区切り文字を引数に指定することができる
  #　引数を省略した場合は改行を区切り文字にする
  def toFormattedString(sep = "\n")
    "書籍名：#{@title}#{sep}著者名：#{@author}#{sep}ページ数：#{@page}#{sep}発刊日：#{@publish_date}#{sep}"
  end

  end

#BookinfoManagerクラスを定義する
class BookinfoManager
   def initialize( filename )
      #初期化でcsvファイルを指定する
      @csv_fname = filename
      #蔵書データのハッシュ(配列)の定義。これにより、蔵書データという塊が2つ3つと作れるようになる
      @book_infos = {}
   end

#  蔵書データをセットアップする
  def setUp
   #CSVファイルを読み込みモードでオープンにする
    open(@csv_fname,"r:UTF-8") {|file|
    #　ファイルの行を1行ずつ取り出して、lineに組み込む
      file.each{|line|
      #　lineからchompで改行を除き、splitでカンマ区切りに分割し、
      #　左辺それぞれの項目へ多重代入する
      key, title, author, page, pdate = line.chomp.split(',')
      #　蔵書データは1件分のインスタンスを作成してハッシュに登録する
      #　strptimeは、文字列からDataクラスのインスタンスを作成するメソッド
      @book_infos[ key ] =
          Bookinfo.new(title.to_s,author.to_s,page.to_i,Date.strptime(pdate))
      }
    }
  end

#  蔵書データを登録する
  def addBookinfo
  #蔵書データを1件分のインスタンスを作成する
  book_info = Bookinfo.new("","",0,Date.new)
  #登録するデータを項目ごとに入力する
  print "\n"
  print "キー："
  key = gets.chomp
  print "書籍名："
  book_info.title = gets.chomp
  print "著者名："
  book_info.author = gets.chomp
  print "ページ："
  book_info.page = gets.chomp.to_i
  print "発刊年："
  year = gets.chomp.to_i
  print "発刊月："
  month = gets.chomp.to_i
  print "発刊日："
  day = gets.chomp.to_i
  book_info.publish_date = Date.new(year,month,day)

  #作成した蔵書データの1件分をハッシュに登録する
  @book_infos[key] = book_info
end

#  蔵書データの一覧を表示する
  def listAllBookInfos
  puts "\n------------------------------"
  @book_infos.each{ |key, info|
    print info.toFormattedString
    puts "\n------------------------------"
  }
end

#  蔵書データを全件ファイルに書き込んで保存する
  def saveAllBookInfos
    #CSVファイルを書き込みモードでオープンする
    open(@csv_fname,"w:UTF-8"){|file|
      @book_infos.each{|key,info|
        file.print(info.to_csv(key))
      } #1件ずつの処理の終わり
      puts "\nファイルへ保存しました"
    } #ファイルを閉じている
  end

#  処理の選択と選択後の処理を繰り返す
  def run
  while true
    # 機能選択画面を表示する
    print "
    1,蔵書データの登録
    2,蔵書データの表示
    8,蔵書データをファイルに保存
    9,終了
    番号を選んでください(1,2,8,9)"
    #文字の入力を待つ
    num = gets.chomp
    case
      when '1' == num
        #蔵書データの登録
        addBookinfo
      when '2' == num
        #蔵書データの表示
        listAllBookInfos
      when '8' == num
        #蔵書データをファイルへ保存
        saveAllBookInfos
      when '9' == num
        #アプリケーションの終了
        break;
      else
        #処理選択待ち画面に戻る
    end
  end
end

end


#アプリケーションのインスタンスを作成
#newのうしろに（）で.csv形式としてcsvファイルを指定している
book_info_manager = BookinfoManager.new("book_info.csv")

#BookinfoManagerの蔵書データをセットアップする
book_info_manager.setUp

#BookinfoManagerの処理の選択と選択後の処理を繰り返す
book_info_manager.run

