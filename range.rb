a = (1...10).to_a

puts "a = #{a}"
#输出 a = [1, 2, 3, 4, 5, 6, 7, 8, 9]

b = -1..9
puts b.min # -1
puts b.max # 9
puts b.include?(5) # true | 序列中是否包含 5
puts b.reject { |x| x < 5} # 5 6 7 8 9 | reject也就是能够过滤掉不满足条件的元素


=begin
ruby的range特性，在创造一段连续的串时非常有用，并且除了可以创建数字类型串之外，还可以创建字符型的串
如下:
=end

c = 'a'..'z'
puts c.min
puts c.max


=begin
再看看如下这些奇怪的判断吧，3个等号则相当于上面的 include? 判断
=end

puts (1..10) === 5       # true
puts (1..10) === 15      # false
puts (1..10) === 3.14159 # true
puts ('a'..'j') === 'c'  # true
puts ('a'..'j') === 'z'  # false
