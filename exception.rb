=begin
Use raise to throw an Exception.
=end

puts "===================Throw an Exception==================="

def raise_exception
  puts 'I am before the raise.'
  # raise 'An error has occured'
  # `raise_exception': An error has occured (RuntimeError)
  # raise默认抛出 Runtime 异常
  puts 'I am after the raise'
end
raise_exception

puts "===================Handle Exception==================="

=begin
Handle Exception
=end
def raise_rescue
  begin
    puts 'I am before the raise.'
    raise 'An error has occured.'
    puts 'I am after the raise.'
  rescue RuntimeError # 指定捕获异常的类型
    puts 'I am rescue!'
  end
  puts 'I am after the rescue.'
end

raise_rescue


puts "===================Handle Multiple Exception==================="
=begin
Handle Multiple Exception
=end
def raise_multiple_rescue
  begin
    puts 'I am before the raise.'
    raise 'An error has occured.'
    puts 'I am after the raise.'
    raise ArgumentError,"参数错误!"
    puts 'here'
  rescue RuntimeError # 指定捕获异常的类型
    puts 'I am RuntimeError rescue!'
  rescue ArgumentError
    puts "I am ArgumentError resuce!"
  else
    puts "I am other resuce!"
  end
  puts 'I am after the rescue.'
end

raise_multiple_rescue


puts "===================Get Exception Info==================="
=begin
Get Exception Info
=end
def raise_exception_info
  begin
    puts 'I am before the raise.'
    raise 'An error has occured.'
    puts 'I am after the raise.'
  rescue RuntimeError => e
    puts e.message
    puts e.backtrace.inspect # 打印具体的错误位置
  end
  puts 'I am after the rescue.'
end
raise_exception_info

=begin
===================Get Exception Info===================
I am before the raise.
An error has occured.
["/Volumes/work/html/ruby/exception.rb:66:in `raise_exception_info'", "/Volumes/work/html/ruby/exception.rb:74:in `<top (required)>'", "-e:1:in `load'", "-e:1:in `<main>'"]
I am after the rescue.
=end

=begin
RuntimeError (这是raise默认抛出的异常), 另外还有
NoMethodError, NameError, IOError, TypeError和ArgumentError等等。
=end


puts "===================File Operator Exception==================="
begin
  File.open('p014constructs.rb', 'r') do |f1|
    while line = f1.gets
      puts line
    end
  end

  # Create a new file and write to it
  File.open('test.rb', 'w') do |f2|
    # use "" for two lines of text
    f2.puts "Created by Satish\nThank God!"
  end
rescue Exception => msg
  # display the system generated error message
  puts msg
end

