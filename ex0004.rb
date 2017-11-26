str = "twinkle,twinkle, little star
how i wonder what you are.
ub above the world so high,
like a diamond in the sky.
twinkle, twinkle, little star,
how i wonder what you are.."

#上の歌詞を行ごとに分類
lines = str.split(/\n/)

# youにマッチする行を表示する
puts "youが含まれる行"
lines.each{ |line|
  if line =~/[\y]ou/ then
    puts line
  end
}

puts ""

#行末に","が来ている行を表示する
puts "行末にカンマが表示されている行"
lines.each{|line|
  if line =~ /,$/ then
    puts line
  end
}

