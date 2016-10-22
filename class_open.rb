puts "String类中以test开头的方法 : "
puts String.methods.grep /^test/ # 输出 : String类中以test开头的方法 :

=begin
在ruby中，类始终是open的，或者可以说，类始终是开放的
我们可以为任何类增加任意的方法，那么怎么加呢？

从上面的例子，我们打印String类中以 test 开头的方法，但是并没有任何东西输出
也就是String类中并没有以test开头的方法
那么我们就以String类为例，为String新增一个 test_open 方法
=end

class String
  def test_open
    puts "String类新方法 test_open!"
  end
end

s = "Hello Ruby!"
s.test_open #输出 : String类新方法 test_open!
puts "s的长度 : #{s.length}"

=begin
可以发现，我们确实为String类新增了 test_open 方法
并且新增的方法，完全没有影响原来String类中的方法
=end

=begin
但是 ruby 的这个特性貌似并不会带来什么好处，反而是很危险的！
因为我们难以解决的问题是如果 String 类中刚好存在 test_open 方法怎么办？
所以一定要确保要新增方法不要与类中的方法冲突！
这个特性，建议不要用，而是转而继承String类，这样新增的方法也仅仅是重写(overwrite)
而不会影响父类的方法。
=end



