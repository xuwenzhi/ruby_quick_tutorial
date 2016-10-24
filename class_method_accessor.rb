class Article
  def initialize(title, content)
    @title     = title
    @content   = content
  end
  attr_reader :title, :content # 只读
  attr_writer :title # 可写
end

a = Article.new('标题', '内容')
puts a.title # 输出 : 标题
puts a.content # 输出 : 内容

a.title = "标题1"
puts a.title # 输出 : 标题1

# 然而content只有只读权限，如果这时候为它赋值会怎样？
#a.content = "标题" # ERROR ： undefined method `content=' for #<Article:0x007fe03c80bc08

