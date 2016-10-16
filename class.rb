#!/usr/bin/env ruby

class Hello
    attr_accessor :names
    def initialize(names = "World!")
        @names = names
    end
    def say_hello
        if @names.nil?
            puts "..."
        elsif @names.respond_to?("each")
            # @names is a list of some kind, iterate!
            @names.each do |name|
                puts "Hello #{name}!"
            end
        else
            puts "Hello #{@names}!"
        end
    end
end


if __FILE__ == $0
    hello = Hello.new
    hello.say_hello

    hello.names = "world"
    hello.say_hello

    hello.names = ["world1", "world2", "world3"]
    hello.say_hello

    hello.names = nil
    hello.say_hello
end

