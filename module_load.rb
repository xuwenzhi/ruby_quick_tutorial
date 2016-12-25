=begin
这里主要说明的是require 和 load 的区别和用法

require : 用于加载类库
load : 用于加载代码

=end

=begin
如果出现命名空间冲突怎么办?
可以通过load('xxx.rb', true)指定第二个参数为true，则ruby会将xxx.rb作为匿名模块加载进来
=end

=begin
还有一种加载模块的方法，比如将模块加载到一个类中会发生什么?
那就需要理解 include 和 prepend
=end

module M1

end

module M2
 include M1
end

module M3
  prepend M1
  include M2
end

puts M3.ancestors.to_s

=begin
include : 加载模块的时候会将加载模块设置在当前模块的上方
prepend : 与include不同，会将家在模块设置在当前模块的下方

在此例子中，M3先将M1加载到自己的模块的下方，然后在include M2,因为M2中又存在include M1
但注意刺客并不会做任何操作，因为M3已经将M1设置在祖先链中了，所以什么也不会做。
=end