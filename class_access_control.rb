=begin
Access Control（类的权限控制）
public
protected
private
=end

puts "===================AccessControll==================="

class ClassAccess
  def m1          # this method is public
  end
  protected
  def m2        # this method is protected
  end
  private
  def m3        # this method is private
  end
end
ca = ClassAccess.new
ca.m1
#ca.m2
#ca.m3

=begin
除了这样的方式指定类中属性与方法的访问控制外，还可以通过下面的方式指定
=end

class ClassAccess
  def m1          # this method is public
  end
  def m2        # this method is protected
  end
  def m3        # this method is private
  end
  protected :m2
  private :m3
end
ca = ClassAccess.new
ca.m1
#ca.m2
#ca.m3


=begin
Overriding private methods（重写父类的私有方法）
如果父类中存在私有方法，故其子类虽然继承了该私有方法，但是却无法访问，但是子类是可以重写父类的私有方法的，例如
=end
class A
  private
    def f
      puts "子类无法访问我！"
    end
end
class B < A
end
class C < A
  def f
    puts "重写父类的私有方法，我就能访问了！"
  end
end
#B.new.f # private method `f' called for #<B:0x007fe23302fc48> (NoMethodError)
C.new.f # 重写父类的私有方法，我就能访问了！


