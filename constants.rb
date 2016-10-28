=begin
在ruby中定义常量很简单，只需要定义大写字母并以下划线分割的变量即为常量
=end

A_CONST = 10 #定义常量

=begin
既然定义了常量，那么更改它就是一个有问题的操作，此时ruby会报 warning 错误
=end
#A_CONST = 20 # warning: already initialized constant A_CONST

=begin
虽然常量一经定义就无法再更改，BB但是还是可以通过更改常量的引用来更改常量的值，具体例子见下面
=end
AA_CONST = "Doshi"
BB_CONST = AA_CONST # BB_CONST为AA_CONST的引用
BB_CONST[0] = "J" # alter string referenced by constant
puts AA_CONST # displays Joshi
puts BB_CONST # also displays Joshi


=begin
ruby中使用常量的简单场景。
=end
OUTER_CONST = 99

class Const
  def get_const
    CONST
  end
  CONST = OUTER_CONST + 1
end

puts Const.new.get_const
puts Const::CONST
puts ::OUTER_CONST #由于OUTER_CONST是类外的常量，所以可以通过 ::OUTER_CONST 来调用
puts Const::NEW_CONST = 123 #为类新增常量值