class MyClass
  def my_method
    @v = 1 # 为MyClass设置实例变量
  end
end

obj1 = MyClass.new
puts "调用obj1.my_method前:#{obj1.instance_variables}"
obj1.my_method
puts "调用obj1.my_method后:#{obj1.instance_variables}"

obj2 = MyClass.new
puts "调用obj2.my_method后:#{obj2.instance_variables}"

=begin
ruby的实例变量是可以动态设置的，并且对象的实例变量是存放在对象中而不是类中。
=end