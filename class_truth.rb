=begin
类的真相!

在ruby中，类本身就是对象！
=end

puts "===================类的本质是什么?=========================="
puts "hello".class # 不要忘记string本身是对象
puts String.class # 而String类本身也是对象，ruby内置这些类的类就是 Class


=begin
你好像知道ruby的所有存在最终都是一个对象，那么这个 Class 是什么东东？
=end

puts "Class都有哪些方法 : #{Class.instance_methods(false)}"

=begin
new : 用来创建对象的方法
allocate : 用来创建对象的支撑方法
superclass : 类的超类

所以就有一句类的细致概念:
类就是一个对象（Class类的一个实例）外加一组实例方法和一个对其超类的引用。
=end

=begin
让我们看看ruby的继承体系
BaseObject(ruby类的根节点) -
             Object -
                      Module - Class
                               Array
                               Numeric
                               Regex
                               String
                               IO

=end


=begin
祖先链
=end
puts "类的祖先链:"
puts "hello".class.ancestors.to_s

=begin
从祖先链中会发现有一个kernel，这是ruby内置的module，并且已经加载到了Object中
那么是怎么注入的，可以看module_load.rb
=end


=begin
ruby的类太过灵活，导致可以在运行时改变类的结构，一定要注意，不要乱改。
=end


