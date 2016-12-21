=begin
对象模型是ruby的灵魂，刚刚接触ruby你会发现ruby中处处皆对象。
在ruby中，大到Module和Class，小到Array、Numeric、Hash、Regex、String和IO都是对象。
ruby对象模型的灵活超乎你的想象，这种灵活性造就了ruby能够轻易做到元编程。
=end

=begin
只要你想，请随意为ruby内置的类增加方法和属性。
!!!(但是请不要随便为类添加已经存在的属性或方法)!!!
=end
class String
  def to_alphanumeric
    gsub(/[^\w\s]/, '')
  end
end
puts "#fds$#432423 fFss$232".to_alphanumeric

=begin
我们都知道String类是ruby内置的类，而这里看起来好像是重新定义了String类
但其实不是的，而是ruby会检查String类是不是已经定义好的类
1.如果不是，那么首次定义这个类
2.如果是，那么ruby会把这个类打开，将新增的方法和属性新增到类里面去
=end


