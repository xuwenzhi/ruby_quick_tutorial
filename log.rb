=begin
日志用于记录程序的执行过程是很有帮助的，尤其是执行的关键节点处的日志往往有助于线上排查问题。
所以，学习如何记录日志在学习任何编程语言中都是很有帮助的！

ruby中将日志分为几个级别，分别为：
Logger.info : 简单记录执行信息
Logger.warn : 记录警告，未达到预期效果但是风险不大的信息
Logger.debug : 用于一步步诊断复杂任务
Logger.error : 通常用于捕获异常，但是不至于将程序崩溃或退出的信息
Logger.fatal : 程序已经无法处理，只能使程序崩溃或退出
=end

=begin
ruby提供了相当便利的日志记录API，可以说非常贴心。
1.从记录日志的方式上来讲，支持 文件 和 流
2.从记录日志的结果上来讲，支持日志按天/月拆分
比如，我们肯定不希望将所有的日志都打印在一个单文件中，但ruby可以很方便的解决我们的问题。
=end

require 'logger'
# 记录当前月份的日志
Logger.new('help/this_month.log', 'monthly')
# 只记录过去20天的日志
Logger.new('help/past_20_application.log', 20, 'daily')
# 当日志大小达到100M时，开始记录新日志
Logger.new('help/over_100m_application.log', 0, 100 * 1024 * 1024)



=begin
下面是一个具体的例子
=end
$LOG = Logger.new('help/log_file.log', 'monthly')
def divide(a, b)
  $LOG.debug("a: #{a}, b: #{b}")
  begin
    result = a / b
  rescue Exception => e
    $LOG.error "Error in division!: #{e}"
    result = nil
  end
  return result
end
divide(10, 2) # 10 / 2 不会抛出异常

divide(10, 0) # 10 / 0 会抛出异常

=begin
输出:
# Logfile created on 2016-10-24 23:36:36 +0800 by logger.rb/41954
D, [2016-10-24T23:36:36.771922 #31744] DEBUG -- : a: 10, b: 2
D, [2016-10-24T23:36:36.772726 #31744] DEBUG -- : a: 10, b: 0
E, [2016-10-24T23:36:36.773112 #31744] ERROR -- : Error in division!: divided by 0
=end