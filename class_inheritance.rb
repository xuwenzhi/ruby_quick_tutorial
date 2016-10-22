=begin
在ruby中，可以轻松的通过 < 来实现类的继承
当然，需要首先点明的是ruby只支持单继承。
=end
class Colors
  def initialize(name)
    @name = name
  end

  def print_name
    puts @name
  end
end
class Red < Colors
  def initialize(name, rgb)
    super(name) # super 相当于PHP的parent，也就是此时调用Colors的initialize
    @rgb = rgb
  end

  def print_name
    puts "name : #{@name}, rgb : #{@rgb}"
  end
end

red = Red.new("红色", "#ffffff")
red.print_name



