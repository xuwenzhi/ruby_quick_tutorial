=begin
这里主要介绍的是ruby的method_missing特性
当调用类中并不存在的函数时，而且为类定义了method_missing方法时，ruby会自动调用method_missing
如果接触过PHP的面向对象的话，对这个一定很熟悉，那就是魔术方法__call()
具体使用，见下面的例子
=end
class MethodMissging
  def method_missing(m, *argv, &block)
    puts "你调用了一个叫做#{m}的方法，但是类中并未定义#{m}方法，所以走到了我这里。";
  end
end

mm = MethodMissging.new
mm.xxxxxxx # MethodMissing中并不存在此方法，则会自动调用method_missing方法

