# I was missing the pluck method of Prototype, so I found a Ruby equivalent:
#
# Author: Wilson Lee
# Licence: Public Domain
# See: http://kourge.net/node/100

module Enumerable
  def pluck(method, *args)
    map { |x| x.send method, *args }
  end
  
  alias invoke pluck
end

class Array
  def pluck!(method, *args)
    each_index { |x| self[x] = self[x].send method, *args }
  end
  
  alias invoke! pluck!
end

