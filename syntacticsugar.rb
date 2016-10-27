=begin
这里说明的是ruby的语法糖
像ruby这种主张敏捷开发的语言来讲，肯定是有一些语法糖的
如果学习到这，初学ruby的同僚肯定会欣赏ruby的这种"随意"的语法
下面介绍一种方便在类中使用setter和getter的语法糖
=end
class People
  def initialize(name)
    @name = name
  end
  attr_reader :name   # name只能读取
end
p = People.new('xuwenzhi')
puts p.name
#p.name = 'new_name' # undefined method `name=' for #<People:0x007fb34280c418 @name="xuwenzhi">

=begin
由于name属性是只读的，所以对象是无法直接进行修改的
那么怎么能够修改name的属性呢？
你可能想到了，加一个set_name方法不就可以了吗？是的，比如
=end
puts "===================set_name()来救场==================="
class People
  def initialize(name)
    @name = name
  end
  def set_name(name)
    @name = name
  end
  attr_reader :name   # name只能读取
end
p = People.new('xuwenzhi')
puts p.name
p.set_name('new_name')
puts p.name

=begin
通过创建set_name方法，就可以做到了，然而ruby为我们实现了更加简便的办法
=end
puts "===================语法糖登场 name=(name)==================="
class People
  def initialize(name)
    @name = name
  end
  def name=(name)
    @name = name
  end
  attr_reader :name   # name只能读取
end
p = People.new('xuwenzhi')
puts p.name
p.name = 'new_name'
puts p.name



