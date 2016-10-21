
# 函数后面的感叹号!和问号?
#"?"被用于标示谓词，即返回Boolean值的方法，如Array.empty?(判断数组中元素是否为空)
#"!"出现在方法名尾部的感叹号表明使用该方法是需要多加小心。


# %w的用法

names1 = [ 'ann', 'richard', 'william', 'susan', 'pat' ]
puts names1[0] # ann
puts names1[3] # susan
# 下面这段代码和上面是相同的
names2 = %w{  ann richard william susan pat }
puts names2[0] # ann
puts names2[3] # susan












