=begin
ruby中的symble就像是一个字符串一样，只不过和字符串的不同之处是，它的前面要有一个冒号(:)
类似于 :name 这样子
1.不需要事先定义symbol，ruby会保证你定义的symbol是唯一的
2.不需要事先指定symbol的类型，ruby会很小心的为你处理

你能创建一个最基本的ruby symbol对象，它仅仅是一个名字或者是一个内在的ID标记
symbol要比string更加高效，两个相同值的string是两个不同的对象，但是如果换做symbol，那就仅仅可以用一个对象搞定

=end

puts "===================为什么说symbol会比string更加高效呢？==================="
puts "string".object_id
puts "string".object_id
puts :symbol.object_id
puts :symbol.object_id

=begin
输出:
70214016328820
70214016328660
399208
399208

你的输出结果可能会和我的不一样，但是可以都可以发现，前两个string的object_id是不同的
而后两个symbol的object_id是相同的。
=end


puts "===================ruby内部是怎么处理symbol的？==================="

puts "ruby在内部维护了一个全局的symbol表来保存symbol变量
symbol就是一个名字的实例，这个实例有可能是一个变量，有可能是一个函数，更有可能是一个类
假如你定义了一个函数get_name，那么会自动生成一个名叫 :get_name 的symbol，ruby解释器会帮忙解释
那么如何查看自定义的函数已经进入了ruby的全局symbol表呢？看下面的例子"

puts "===================看看我们定义的函数是否添加到了ruby的全局symbol表中==================="
def get_name
  puts "heihei"
end
puts Symbol.all_symbols
=begin
输出:
...省略
try_enter
$-p
$-l
$-a
get_name

在这里我们通过打印当前ruby解释器中的所有symbol，则就可以发现我们定义的get_name被ruby加入了全局symbol表中。
=end


=begin
上面我们说了使用symbol会比使用string要高效，那么以后在写ruby代码的时候要怎么体验到symbol的优势呢？
看下面的例子:
=end


know_ruby = 'yes'
if know_ruby == 'yes'
  puts 'You are a Rubyist'
else
  puts 'Start learning Ruby'
end
#输出: You are a Rubyist

#上面是使用string来实现的一个简单的判断，翻译成symbol如下:

know_ruby = :yes
if know_ruby == :yes
  puts 'You are a Rubyist'
else
  puts 'Start learning Ruby'
end

=begin
这两种代码输出的结果是一样的，那么为什么要使用下面这种symbol的呢？
原因在于上面的string版本中的 'yes' 出现了两次，而这两次ruby都会为其在内存中分配空间
而下面的symbol中的 :yes ，虽然也出现了两次，但ruby解释器只需要向内存申请一份空间即可
=end





=begin
何时使用string？何时使用symbol
If the contents (the sequence of characters) of the object are important, use a string
If the identity of the object is important, use a symbol
=end

