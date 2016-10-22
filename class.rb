#!/usr/bin/env ruby

=begin
ruby的OOP风格和其他编程语言类似，也有构造方法、属性等东东
initialize()为ruby特定的构造方法。
如下，我们将建立一个Hello类，做相关操作。
=end
class Hello
  attr_accessor :names # 定义names属性
  #构造方法
  def initialize(names = "World!")
      @names = names
  end

  def say_hello
      if @names.nil? #当前names属性是否是nil
          puts "..."
      elsif @names.respond_to?("each") #当前的names属性是否可以执行 each 操作
          # @names is a list of some kind, iterate!
          @names.each do |name|
              puts "Hello #{name}!"
          end
      else
          puts "Hello #{@names}!"
      end
  end

  def hello
    puts "hello"
  end
end

if __FILE__ == $0
  hello = Hello.new
  puts "当前hello对象的names值为:" + hello.names #输出 : 当前hello对象的names值为:World!
  hello.say_hello #输出 : Hello World!!

  hello.names = "ruby"
  puts "当前hello对象的names值为:" + hello.names #输出 : 当前hello对象的names值为:ruby!
  hello.say_hello #输出 : Hello ruby!

  hello.names = ["world1", "world2", "world3"]
  puts "当前hello对象的names值为:" + hello.names.to_s #输出 : 当前hello对象的names值为:["world1", "world2", "world3"]
  hello.say_hello #输出 Hello world1! Hello world2! Hello world3!

  hello.names = nil
  puts "当前hello对象的names值为:" + hello.names.to_s #输出 : 空
  hello.say_hello #输出 : ...

  hello1 = hello

  puts "hello object-id : #{hello.object_id}"
  hello.display
  hello1.display
  puts "hello1 object-id : #{hello1.object_id}"

end


=begin
不是所有的对象都需要用 new 来创建，例如
String - 'hello' or "hello"
Symbol - :symbol or :"hello world"
Array - [x, y, z]
Hash - {"India" => "IN"}
Range - 3..7 or 3...7
=end


=begin
Garbage Collection(GC)
ruby采用mark-and-sweep策略来进行垃圾回收，mark操作会检查对象是否在当前执行区被使用，如果被使用则会做mark操作。
当一个对象已经很久没有被使用，这个对象就不会被mark，这时会做sweep操作，将对象回收。
=end


=begin
built-in classes and modules in ruby

Array, Bignum, Class, Dir, Exception, File, Fixnum, Float, Integer, IO, Module, Numeric, Object, Range, String, Thread, Time.
Some built-in modules are Comparable, Enumerable, GC, Kernel, Math.
=end