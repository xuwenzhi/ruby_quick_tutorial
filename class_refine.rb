=begin
Refinement 细化

在ruby中可以为内置的类创建方法，比如
=end

class String
  def to_alphanumeric
    gsub(/[^\w\s]/, '')
  end
end

puts "#$@fdsfxx34324(*".to_alphanumeric

=begin
细心的我们肯定会发现这里是有陷阱的，那就是有可能无意中为String类
添加的函数是已存在的内置函数就会出问题了，这时，可以使用refine
实际上就相当于为String扩展方法添加了命名空间一样的道理
=end

module StringExtension
  refine String do
    def to_alphanumeric
      gsub(/[^\w\s]/, '')
    end
  end
end

module StringStuff
  using StringExtension
  puts "#$@fdsfxx34324(*".to_alphanumeric
end


=begin
慎用!!!
=end