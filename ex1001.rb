require 'date'

class BookInfo
  def initialize(title,author,page,publish_date)
    @title = title
    @author =author
    @page = page
    @publish_date = publish_date
  end

  #最初に検討する属性に対するアクセサを提供する
  attr_accessor :title, :author, :page, :publish_date

  # Bookinfoクラスの文字列を返す
  def to_s
    "#@title,#@author,#@page,#@publish_date"
  end

  # 蔵書でーたを書式づけて出力する操作を追加する
  # 項目の区切り文字を引数に設定することができる
  # 引数を省略した場合は、改行を区切り文字にする
  def toFormattedString( sep = "\n")
    "書籍名： #{@title}#{sep}著者名：#{@author}#{sep}ページ数：#{@page}ページ#{sep}発刊日：#{@publish_date}#{sep}"
  end
end

#BookInfoクラスのインスタンスを作成し、Book_infoという名前を付ける
book_info = BookInfo.new(
                        "実践アジャイル　ソフトウェア開発法とプロジェクト管理",
                        "山田 正樹",
                        248,
                        Date.new(2005, 1, 25)
)

# bookinfoのデータの文字列表現を得る
puts book_info.to_s

# book_infoのアクセサを使ってみる
puts "書籍名：" + book_info.title
puts "著者名：" + book_info.author
puts "ページ数：" + book_info.page.to_s
puts "発刊日:" + book_info.publish_date.to_s

#book_infoの書式をつけて出力する操作を使ってみる
puts book_info.toFormattedString
puts book_info.toFormattedString("/")