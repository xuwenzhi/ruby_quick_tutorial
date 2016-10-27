=begin
ruby中的对象如果按照特定的维度，可以分为可变(Mutable)对象和不可变(Immutable)对象。
那么，可变对象和不可变对象有什么区别?
1.不可变对象是线程安全的
2.不可变对象使得能够更容易的进行封装
3.不可变对象可以更加友好的维护hash的key，因为这些key是不可变的

Note:ruby中，可不可变是对象的属性，与类无关!
=end

puts "===================Freezing Object==================="
str = 'A simple string. '
str.freeze
begin
  str << 'An attempt to modify.'  # << 是一种比+=更加高效的追加字符串的语法
rescue => err
  puts "#{err.class} #{err}"
end
# The output is - TypeError can't modify frozen string

=begin
当对象调用freeze方法后，如果通过<<符进行操作str时，实际上操作的是str的引用，或者理解为指针
这时操作的实际上是str地址，然而，既然已经freeze了，ruby就会报TypeError异常!

然而，看下一个例子，通过上下两个例子，我们可以发现 += 和 << 之间的不同。
=end

str = 'Original string - '
str.freeze
str += 'attachment'
puts str
# Output is - Original string - attachment

=begin
我们发现，虽然str已经调用过freeze了，但是通过+=操作，str确实变了，这怎么回事？
为什么+=就可以更新str呢？
其实+=在这里会创建一个新的字符串对象比如叫new_str，new_str的值为 str+'attachment'
然后ruby会做 str = &new_str的操作，str的地址并没有发生变化，只是str成为了new_str的引用
值也就发生了变化~
=end


=begin
frozen?
=end

a = b = 'Original String'
b.freeze
puts a.frozen? # true
puts b.frozen? # true
a = 'New String'
puts a
puts b
puts a.frozen? # false
puts b.frozen? # true



=begin
何时使用freeze？
=end
