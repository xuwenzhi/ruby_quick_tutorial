=begin
这里介绍的是ruby的Overloading（重载）
重载也就是可以在一个类中定义同名函数
但并不像redefining一样，在类中下面的函数会完全覆盖上面的函数
当然，你肯定是知道重载这个概念的，那么如何在ruby中使用重载？
=end
class Overloading
  # 通过传递函数 *args 参数，即可通过args参数的数量或者判定变量类型，即可使用到ruby中的重载
  def initialize(*args)
    if args.size == 1
      puts "一个参数!"
    elsif
      puts "不是一个参数!"
    end
  end
end

Overloading.new(1)
Overloading.new(1, 2)