=begin
这里主要介绍的是ruby的method_missing特性
当调用类中并不存在的函数时，而且为类定义了method_missing方法时，ruby会自动调用method_missing
如果接触过PHP的面向对象的话，对这个一定很熟悉，那就是魔术方法__call()
具体使用，见下面的例子
=end
class MethodMissging
  def method_missing(m, *args, &block)
    puts "你调用了一个叫做#{m}的方法"
    if(args.count != 0)
      puts "(并传递了#{args}参数)"
    end
    puts ",但是类中并未定义#{m}方法，所以走到了我这里。";
  end
end

puts "===================调用类中不存在的方法==================="
mm = MethodMissging.new
mm.xxxxxxx('1', '2') # MethodMissing中并不存在此方法，则会自动调用method_missing方法


=begin
由上面的例子可以发现上面所说的，当我调用xxxxxxx这个方法时，自动调用了method_missing方法
并且也可以通过method_missing的3个参数，知道我们调用了哪个函数(m)，以及传递了什么参数(*args)和code block(&block)即闭包等信息
这种自动调用的特性，尽可以发挥我们的想象力，比如实现钩子的特性等。
=end

