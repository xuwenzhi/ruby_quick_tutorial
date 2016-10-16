=begin
Hash 也就是通常所说的 关联arrays, maps, or dictionaries等等。
和数组很像，Hash一般都会有一个索引(index)和值(value)。
=end

puts "===================Hash的定义？==================="
h = {'dog' => 'canine', 'cat' => 'feline', 'donkey' => 'asinine', 12 => 'dodecine'}
puts h.length  # 4
puts h['dog']  # 'canine'
puts h
puts h[12]
puts h[1000] == nil # 访问越界下标时返回 nil
#输出:
#4
#canine
#{"dog"=>"canine", "cat"=>"feline", "donkey"=>"asinine", 12=>"dodecine"}
#dodecine
#true


=begin
1.hash的定义使用花括号包围，index与value之间通过等号箭头(=>)分割，这一点类似于PHP中数组的定义。
2.访问一个不存在的index时，会返回nil
所以说，ruby中的hash和数组是很相似的，那么有什么不同吗？
看如下的例子:
=end

puts "===================Hash相较于Array的优势：可以存放对象==================="
h = {'object' => Array.new}
puts h
#输出 : {"object"=>[]}

=begin
综上:
1.Hash可以存放对象
2.Hash类拥有很多函数，当我们使用Hash来做数据存储时就可以很便利地使用到其中的函数(当然Array类也同样提供了很多有用的函数)
3.Hash类文档可以在这里找到 http://ruby-doc.org/core-2.3.0/Hash.html
=end


puts "===================在Hash中使用symbol==================="

people = Hash.new
people[:nickname] = 'IndianGuru'
people[:language] = 'Marathi'
people[:lastname] = 'Talim'
puts people[:lastname] # 输出 : Talim

=begin
既然Hash的index可以为string，那么必然也可以使用symbol(也是为了品尝到symbol相较于string的优势:smile:)
=end














