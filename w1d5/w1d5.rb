class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end


class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
    el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    exist = false
    @map.map! do |pair|
      if key == pair[0]
        pair[1] = value
        exist = true
      end
    end
    @map.push([key, value]) unless exist
  end

  def lookup(key)
    @map.each do |pair|
      return pair[1] if pair[0] == key
    end
  end

  def remove(key)
    @map.reject {|pair| pair[0] == key}
  end

  def show
    deep_dup(@map)
  end

  def deep_dup(array)
    array.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end
