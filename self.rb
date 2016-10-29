=begin
要理解self首先要理解上下文环境的概念，或者可以借助其他编程语言中的全局变量和局部变量来理解。
=end

x = 1 # 在此定义的x即为一个全局变量

puts self #输出 : main 此时的self则属于一个全局的环境当中

=begin
所以上面的的上下文环境，则为最高等级的一个环境，那么低等级的上下文环境时什么样子的?
下面我们定义一个类S，来解释在类和module中的 self 是什么样子
=end

class S
  puts '开始类S'
  puts self
  module M
    puts '类中定义的Module'
    puts self
  end
  puts '回到类S上下文环境'
  puts self
end

=begin
综合上面两段代码上下文环境大体上是 main -> S -> S::M
=end