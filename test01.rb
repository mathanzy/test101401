puts "你好，世界！";


#1、练习使用Ruby中的case语句和数组元素的遍历
=begin
tags=["A", "IMG", "PRE"]
tags.each do |tagname|
  case tagname
    when "A", "BBBBDD","FFF"
      puts "#{tagname} is a child"
    when "IMG", "123"
      puts "#{tagname} is not a child"
    else
      puts "#{tagname} cannot be used"
  end
end
=end

#2、%w的用法
=begin
A=["a",  "b", "c", "d"]
B=%w(a b c d)
puts"#{A}"
puts "#{B}"
puts A
puts B
=end

#3.块局部变量和块变量， 局部变量
=begin
x=y=z=0
ary=[1,2,3]
ary.each do |x|
  y=x
  z=x
  p [x,y ,z]
end
puts
p [x,y,z]
=end

# 4.模块及方法，以及方法中调用关键字self
=begin
module HelloModule
  Version = 1   #Ruby中常量以大写英文字母开头
  def hello(name)
    puts "Hello, #{name}."
  end
  module_function :hello
end
#p HelloModule::Version
HelloModule.hello('Alice')

p '-'*30
include HelloModule
p Version
hello('Blice')
HelloModule.hello('Clice')
=end

###################################################
=begin
#5. 从文件中读取内容并输出
filename = ARGV[0]
file =  File.open(filename)
text = file.read
print text
file.close

#6.利用正则表达式解析电子邮件
filename = ARGV[0]
file =  File.open(filename)
text = file.read
text.each_line do |line|
  case line
    when /^From:/i
      puts "发现寄件人信息"
    when /^To:/i
      puts "发现收件人信息"
    when /^subject:/i
      puts "发现主题信息"
    when /^$/
      puts "头部解析完毕"
      exit
    else
      ##跳出处理
      end
  end
=end
###################################################

#7.extend方法可以使单例类包含模块，并把模块的功能扩展到对象中。
=begin
module Edition
  def edition(n)
    "#{self}第#{n}版"
  end
end

str = "Ruby基础教程"
str.extend(Edition)
puts str
puts str.edition(4)
p str.edition(4)
=end

#9. 类与Mix-in
#除了之前介绍的定义类方法的语法外，使用extend方法也同样能为类对象追加类方法。
# 下面使用extend方法追加类方法，使用include方法追加实例方法的一个例子。
=begin
module ClassMethods  #定义类方法的模块
  def cmethod
    "class method"
  end
end

module InstanceMethods  #定义实例方法的模块
  def imethod
    "instance method"
  end
end

class Myclass
  #使用extend方法定义类方法
  extend ClassMethods
  #使用include定义实例方法
  include InstanceMethods
end

p Myclass.cmethod
#p Myclass.imethod        #报错：in `<top (required)>': undefined method `imethod' for Myclass:Class (NoMethodError)
p Myclass.new.imethod
# p Myclass.new.cmethod   #报错：in `<top (required)>': undefined method `cmethod' for #<Myclass:0x2245c98> (NoMethodError)
=end

#10,利用Net::HTTP类取得RUBY官网首页的HTML，并将其输出到控制台的脚本。
require "net/http"
require "uri"
url = URI.parse("http://www.ruby-lang.org/ja/")
http = Net::HTTP.start(url.host,url.port)
doc = http.get(url.path)
puts doc

#11.和类一样，在模块中定义的常量可以通过模块名访问。
p HelloModule::Version    #HelloModule为已定义的模块
p Math::PI