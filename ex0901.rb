class Student
  # Studentクラスのインスタンスを初期化する
  def initialize(name,age)
    @name = name
    @age = age
  end

  # name属性のゲッターメソッド
  def name
    @name
  end

  # age属性のゲッターメソッド
  def age
    @age
  end

  # name属性のセッターメソッド
  def name=( value )
  @name = value
  end

  # age属性のセッターメソッド
  def age=( value )
    @age = value
  end
end

  # Studentクラスのインスタンスを文字列表現を返す
  def to_s
    "#@name,#@age"
  end



#studentクラスのインスタンス(設計図の実物)を作成
shin = Student.new("久保秋　真",45)
hiroyoshi = Student.new("高田　英寿",41)

#インスタンスの名前と年齢を表示する
puts shin.to_s
puts hiroyoshi.to_s
puts "氏名: #{shin.name}, 年齢：#{shin.age}歳"
puts "氏名: #{hiroyoshi.name}, 年齢：#{hiroyoshi.age}歳"