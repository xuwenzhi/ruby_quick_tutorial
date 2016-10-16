=begin
在ruby中数组和其他编程语言没有什么差别，下标均是以 0 开始，以数组长度 - 1 为结尾
当发生下标越界的时候，ruby并不会抛出异常，而是会返回 nil
=end

puts "====================数组的定义===================="

# 定义数组
arr1 = []

# 打印越界下标元素时
if arr1[0] == nil && arr1[-1] == nil && arr1[10000] == nil
  puts "怎么访问都越界"
end

puts "====================数组里面都能放什么?===================="

# 混乱的ruby数组
arr2 = [1, '2', [3, 4]]
puts "#{arr2[0]} "+ arr2[1] + " " + arr2[2].to_s + "\r\n"

=begin
虽然说是混乱，但这里当然是一种"褒义"的说法，从输出结果可以看出
在ruby中，数组的元素可以包含其他类型，比如整型、字符串甚至是嵌套对象都是可以的。
=end

puts "=====================遍历数组==================="

arr3 = ['Apple', 'Facebook', 'Google', 'Airbnb']
arr3.each do |item|
  puts "current item : " + item
end

# 在ruby中遍历数组同样简单，上面这段代码以php翻译过来也就是
=begin
$arr3 = ['Apple', 'Facebook', 'Google', 'Airbnb'];
foreach($arr3 as $item){
  echo "current item : " .$item;
}
=end


puts "=====================常用的内置函数==================="

arr4 = [45, 23, 1, 90]
arr5 = arr4.sort
puts "数组从小到大排序:"
puts arr5
puts "数组长度: "+arr4.length.to_s
puts "数组第一个元素: "+arr4.first.to_s
puts "数组最后一个元素: "+arr4.last.to_s


=begin
1.sort函数返回已排好序的数组，原数组不发生变化
2.length函数返回数组长度
3.first返回数组第一个元素
4.last返回数组最后一个元素
=end



puts "=====================数组的并行赋值==================="
arr6 = [1,2,3,4]
a,b = arr6
puts "a,b = arr6 : a=#{a}, b=#{b}"
#输出 a=1, b=2
#也就是说，通过逗号分隔的a和b，会与数组arr6的第一个元素和第二个元素一一对应
#下面再来看一个例子

a,*b = arr6
puts "a,*b = arr6 : a=#{a}, b=#{b}"
#输出 a=1, b=[2, 3, 4]
#注意到b前面新增一个星号(*)时，会将数组arr6从第二个元素到最后一个一个元素赋值给b
#此时b为一个数组


=begin
综上，通过逗号(,)来将变量分隔，就可以实现ruby并行赋值，然而除了可以将数组进行并行赋值，
还可以将普通变量进行并行赋值，看下面的例子
=end
a,b = 10, arr6
puts "a,b = 10, arr6 : a=#{a}, b=#{b}"
#输出 a=10, b=[1, 2, 3, 4]
#可以发现，等号右侧不仅仅只放数组，同时通过逗号分隔变量和数组呢

#注意，此时的b是arr6的一个拷贝，而不是引用，那么何以这么说呢？
arr6 = [1,2,3,4]
a,*b = arr6
arr6.push 5
puts "a,b = arr6 & arr6.push 5 :  a=#{a}, b=#{b}, arr6=#{arr6}"
#输出 a,b = arr6 & arr6.push 5 :  a=1, b=[2, 3, 4], arr6=[1, 2, 3, 4, 5]
#在此例子中，b经过并行赋值后为[2,3,4]，此时我们为arr6追加一个元素，此时的arr6为[1,2,3,4,5]，而b依旧是[2,3,4]


puts "=====================数组赋值==================="
arr7 = [1,2,3,4]
a = arr7
puts "a = #{a}"
arr7.push 5 #更改原数组
puts "arr7 = #{arr7}"
puts "a = #{a}"
#输出
#a = [1, 2, 3, 4]
#arr7 = [1, 2, 3, 4, 5]
#a = [1, 2, 3, 4, 5]

#当通过等号(=)对数组进行赋值时，得到的是数组的引用!



=begin
更多 : http://ruby-doc.org/core-2.3.0/Array.html
=end


