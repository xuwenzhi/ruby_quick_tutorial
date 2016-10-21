=begin
这里主要介绍的是ruby的proc特性，这是一个与闭包(code block)相关的概念
前面已经对ruby的闭包(code block)有了一点点介绍
那么这个proc又是什么东西呢？先看一个例子
=end

prc = lambda {puts 'Hello'}
# call方法将会自动执行lambda代码块
prc.call

# 而下面的例子也是可以的，两个例子的差别，实际上也就是 { <=> do  以及 } <=> end
toast = lambda do
  'Cheers'
end
puts toast.call


=begin
我们通常是无法将函数以参数的形式传递给另一个函数的，但是你可以传递一个proc，请看下面的例子
=end

def some_mtd some_proc
  puts 'mtd开始:'
  puts "调用proc : "
  some_proc.call
  puts 'mtd结束。'
end

say = lambda do
  puts 'Hello'
end
some_mtd say #调用some_mtd，并传递参数 say，但是这里的 say 是一个code block

=begin
输出:
mtd开始:
调用proc :
Hello
mtd结束。

如前面所说的，这里为some_mtd方法传递了一个code block(say)，而不是传递一个完整的函数，因为这是错误的
当在some_mtd中，some_proc.call(实际上为say.call)实际上也就是执行了say代码块
=end

=begin
思考一下，这像不像在PHP中的
<?php
$say = function(){
  echo "Hello";
}
????
=end