require 'thread'
require 'pry'

queue = Queue.new
(0..50).to_a.each{|x| queue.push x }
workers = (0...4).map do
  Thread.new do
    begin
      while x = queue.pop(true)
        binding.pry
        50.times{print [128000+x].pack "U*"}
      end
    rescue ThreadError
    end
  end
end
workers.map(&:join)
