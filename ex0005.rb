require 'date'

#蔵書1冊分の蔵書データのクラスを作る
class Bookinfo
  #bookinfoクラスのインスタンスを初期化する
  def initialize( title, author, page, publish_date )
    @title = title
    @author = author
    @page = page
    @publish_date =publish_date
  end

  #最初に検討する属性に対するアクセサを提供する
  attr_accessor :title, :author, :page, :publish_date

  #bookinfoクラスのインスタンスの文字列表現を返す
  def to_s
    "#{@title},#{@author},#{@page},#{@publish_date}"
  end


  def toFormattedString( sep = "\n")
    "書籍名: #{@title}#{sep}著者名：#{@author}#{sep}ページ数：#{@page}#{sep}発刊日：#{@publish_date}#{sep}"
  end

end

#複数冊の蔵書データを登録する
book_infos = Hash.new
book_infos["yamada2005"] = Bookinfo.new(
                                       "入門ruby",
                                       "山田太郎",
                                       255,
                                       Date.new(2005,03,03)
)
book_infos["ooda2006"] = Bookinfo.new(
    "入門perl",
    "田中次郎",
    266,
    Date.new(2005,03,03)
)

book_infos.each{|key, value|
  puts "#{key}: #{value.to_s}"
}