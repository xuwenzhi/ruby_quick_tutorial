=begin
这里介绍ruby的文件读/写操作
=end


puts "===================逐行读取help/hello.txt==================="
File.open('help/hello.txt', 'r') do |f|
  while line = f.gets
    puts line
  end
end

=begin
使用File.open()即可进行文件读取
第一个参数即为文件的路径
第二个参数'r'意为read-only，这也是默认的参数
其中第二个参数还有一些其他的可选值，比如:
'r+' : Read/Write
'w'  : write-only
'a'  : Append

=end


puts "===================最优的做法是手动关闭打开的文件==================="
f = File.new('help/newfile.txt', 'w')
write_char_count = f.write("hello new rubyist!")
puts "一共写入了#{write_char_count}个字符!"
f.close # 关闭打开的文件

=begin
当ruby代码块执行终止的时候，ruby解释器会自动关闭打开的文件
然而虽然会自动关闭，但为了防止数据丢失，有意识的手动关闭将会是最优的文件操作手法，在其他编程语言中也是同样的。
=end


puts "===================递归读取文件夹==================="
require 'find'
Find.find('./') do |f|
  type = case
           when File.file?(f) then "F"
           when File.directory?(f) then "D"
           else "?"
         end
  # 忽略.git文件夹和.git文件夹下的文件
  if f.include?('git')
    next
  end
  puts "#{type}: #{f}"
end

=begin
ruby支持文件指针,并且可以通过非常容易的移动文件指针达到读取/写入文件的目的。
通过不同的IO常量，则可以很方便的使用文件指针。

=end

puts "===================从文件特定的位置开始读取==================="
f = File.new("help/number.txt") # number.txt文件为 1234567890  10个字符
f.seek(2, IO::SEEK_SET) # 从第3个字符开始读取，即ruby将当前指针位置为 3
puts "从第3个字符开始读取 : " + f.readline # 此时文件指针将从第3个字符开始一步步向后移动直至文件末尾，即当前指针位置为 10
puts "当前指针位置 : #{f.pos}"

f.seek(-5, IO::SEEK_CUR) # 此时指针的位置为 10，向前移动5个字符，即指针当前位置为 6
puts "当前指针位置 : #{f.pos}"
puts "从第#{f.pos}个字符开始读取" + f.readline

puts "当前指针的位置 : #{f.pos}" # 输出 : 10，所以指针又到了文件末尾
f.seek(-8, IO::SEEK_END)
puts "当前指针的位置 : #{f.pos}" # 输出 : 2，所以相对于文件末尾，使指针向前移动了8位

f.close

=begin
IO::SEEK_CUR : 相对于指针当前位置的相对距离
IO::SEEK_END : 相对于文件尾部
IO::SEEK_SET : 相对于文件头部
=end







=begin
关于ruby更多的文件操作相关的API，可以查看http://ruby-doc.org/core-2.3.0/File.html
=end
