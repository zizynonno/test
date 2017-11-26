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
  #BookinfoManagerは、～である。
  def initialize
    #ハッシュ(配列)をつくる
    @book_infos = {}
  end

  #蔵書データをセットアップする
  def setUp
    #複数の蔵書データを登録する(Yamada2005はハッシュキー)
    @book_infos["Yamada2005"] = Bookinfo.new(
        "アジャイルプログラミング",
        "山田太郎",
        234,
        Date.new(2005,1,25)
    )
  end

  #蔵書データを登録する
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

  #蔵書データの一覧を表示する
  def listAllBookInfos
    puts "\n------------------------------"
    @book_infos.each{ |key, info|
      print info.toFormattedString
      puts "\n------------------------------"
    }
  end

  #蔵書データの検索
  def bookSearch
    @book_infos.each{|key, info|
      print"検索ワードを入力してください
"
      #infoをkeyにしてコンソールにYamada2005と入力すると
      # 「おめでとう」と出てくる。infoで色々いじってダメな理由が分からない
      searchword = gets.chomp
      if info =~ /#{searchword}/ then
        puts "おめでとう"
      else
        puts"頑張れ！"
      end
      puts @book_infos.include?("#{searchword}")
    }


  end



  #処理の選択と選択後の処理を繰り返す
  def run
    while true
      # 機能選択画面を表示する
      print "
    1,蔵書データの登録
    2,蔵書データの表示
    3,蔵書データの検索
    9,終了
    番号を選んでください(1,2,9)"
      #文字の入力を待つ
      num = gets.chomp
      case
        when '1' == num
          #蔵書データの登録
          addBookinfo
        when '2' == num
          #蔵書データの表示
          listAllBookInfos
        when '3' == num
          #蔵書データの検索
          bookSearch
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
book_info_manager = BookinfoManager.new

#BookinfoManagerの蔵書データをセットアップする
book_info_manager.setUp

#BookinfoManagerの処理の選択と選択後の処理を繰り返す
book_info_manager.run