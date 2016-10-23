=begin
方法重写(Overriding)
=end
class A
  def func
    puts "A"
  end
end

class B < A
  def func
    puts "B"
  end
end
b = B.new
b.func

=begin
方法重写，或者叫方法覆盖。
实际上指的是在子类中定义和父类相同函数名称的函数，用于实现子类中独特的逻辑
=end

=begin
super
=end
class A
  def func
    puts "A"
  end
end

class B < A
  def func
    super
    puts "B"
  end
end
b = B.new
puts "在B中的 func 使用 super"
b.func

=begin
方法重定义(Redefining)
看一下下面的例子，如果在其他编程语言中的话，这一定会报 "Redeclare" 的错误
但是在ruby中却是一个特性，好吧，看看下面的例子会输出什么呢？
=end
class C
  def func_name
    puts "第一个定义!"
  end
  def func_name
    puts "第2个定义!"
  end
end
C.new.func_name #输出 : 第2个定义!

# 所以，ruby不会阻止你创建更多同名函数，但是会以最后一次定义为准！


=begin
Abstract Class（抽象类）
=end
class AbstractClass
  def welcome
    puts "#{hello} #{name}" #因为这个类是一个抽象类，所以不用定义hello 和 name属性
  end
end

class SubClass < AbstractClass
  #在子类中定义hello 和 name
  def hello; "Hello";
  end
  def name; "Rubyist!";
  end
end

SubClass.new.welcome #输出 ： Hello Rubyist!



