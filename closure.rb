#code block基本用法
def code_blocl1
  yield
end
code_blocl1{ puts "hello!" }

#code block中传递参数
def code_block2
  yield("hello", 100)
end
code_block2{|str, num| puts str+" "+num.to_s}

#使用block_given
def code_block3
  if block_given?
    yield
  else
    puts "no block"
  end
end
code_block3 # => "no block"
code_block3 { puts "hello" } # => "hello"
code_block3 do puts "hello" end # => "hello"

puts "======================================================="

=begin
code block变量
这里主要讲述的是code block外部定义的变量以及内部定义的变量的作用域问题。
=end

#首先看一个例子
x = 10
5.times do |x|
  puts "code block中的当前x是 " + x.to_s # 0 1 2 3 4
end
puts "code block外部的x是" + x.to_s # output 10
#从这个例子中可以得到的信息是code block中的迭代变量x不会影响外部x。

puts "======================================================="

#然而再看一个例子
x = 10
5.times do |y|
  x = y
  puts "code block中的当前y是" + y.to_s # 0 1 2 3 4
end
puts "code block外部的x是" + x.to_s # 4

=begin
由此可以发现，code block的局部是可以拥有全局变量x的，不仅如此而且还能进行更改。
但是这样的话也还是有点危险性的，如果此时在code block中刚好定义了和全局变量同名的变量咋办？
ruby1.9之后提供了下面这样的做法
=end

puts "======================================================="

x = 10
5.times do |y; x|
  x = y
  puts "code block中的当前y是" + y.to_s # 0  1 2 3 4
end
puts "code block外部的x是" + x.to_s # 4

=begin
此时注意到可以通过在code block参数y的后面的"分号"后面设置自己需要用到的参数
这样就不用担心在code block中定义变量会影响到全局变量了。
=end