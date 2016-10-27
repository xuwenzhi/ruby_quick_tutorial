=begin
到目前为止，我们已经发现在ruby中我们无需指定变量的类型，可以说是一种弱类型语言。
但ruby其实并不是弱类型语言，在ruby中所有的变量类型是一个对象，ruby并不关心对象是什么类型，而是关心这个对象可以做什么事情！
通过关注对象的行为来进行集中化的操作将会很方便
看下面的一个例子（虽然并没有发现这个有什么好处！）
=end

class Duck
  def quack
    'Quack!'
  end

  def swim
    'Paddle paddle paddle...'
  end
end

class Goose
  def honk
    'Honk!'
  end
  def swim
    'Splash splash splash...'
  end
end

class DuckRecording
  def quack
    play
  end

  def play
    'Quack!'
  end
end

def make_it_quack(duck)
  duck.quack
end
puts make_it_quack(Duck.new)
puts make_it_quack(DuckRecording.new)

def make_it_swim(duck)
  duck.swim
end
puts make_it_swim(Duck.new)
puts make_it_swim(Goose.new)