require 'date'
class Bookinfo
  # Bookinfo class instance initialize
  def initialize(title,author,page,publish_date)
    @title = title
    @author = author
    @page = page
    @publish_date = publish_date
  end

  #最初に検討する属性に対するアクセサを提供する
  attr_accessor :title, :author, :page, :publish_date

  #bookinfoクラスのインスタンス文字列表現を返す
  def to_s
    "#@title,#@author,#@page,#@publish_date"
  end
end

# bookinfoクラスのインスタンスを作成し、book_infoという名前を付ける
Book_info = Bookinfo.new(
                       "タイトル",
                       "山田",
                       248,
                       Date.new(2005,1,20))
#bookinfo のデータの文字列表現を得る
puts Book_info.to_s

#bookinfoのアクセサを使ってみる
puts "書籍名：" + Book_info.title
puts "著者名：" + Book_info.author
puts "ページ数：" + Book_info.page.to_s
puts "発刊日" + Book_info.publish_date.to_s

