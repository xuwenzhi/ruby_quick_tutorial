=begin
在ruby中存在这么一个概念，module，也就是模块
模块通常是一些常量以及方法的集合，类似于命名空间，并且模块是无法继承的。
模块有两个目标:
1.由于模块存在命名空间的概念，所以通常是常量和方法的集合，并且能够保证不同模块下的同名方法的冲突
=end

module Trig
  PI = 3.1416
  # class methods
  def Trig.sin(x)
    "计算sin()"
  end
  def Trig.cos(x)
    "计算cos()"
  end
end
module Moral
  VERY_BAD = 0
  BAD         = 1
  def Moral.sin(badness)
    puts "计算sin()"
  end
end
puts Trig.cos(Trig::PI/4)
puts Moral.sin(Moral::VERY_BAD)

=begin
2.保证代码的可重用性，如果多个类使用相同的方法，则可以将此方法定义在模块中
=end


module Walk
  def initialize(name)
    @name =name
  end
  def to_s
    @name
  end
  def who_am_i?
    "#{self.class.name} (\##{self.object_id}): #{self.to_s}"
  end
end

class Adult
  include Walk
  # ...
end

class Infant
  include Walk
  # ...
end

adult = Adult.new("大人")
infant = Infant.new("幼儿")
puts adult.who_am_i?
puts infant.who_am_i?


=begin
综上，module更像是一组公共的静态方法，或者可以联想一下，ruby中的module是否类似于PHP的traits呢？
=end
