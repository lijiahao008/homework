
class LRUCache
  def initialize(size)
    @size = size
    @lru_cache = []
  end

  def count
    @lru_cache.size
  end

  def add(el)
    if @lru_cache.include?(el)
      @lru_cache.delete(el)
      @lru_cache << el
    elsif count >= @size
      @lru_cache.shift
      @lru_cache << el
    else
      @lru_cache << el
    end
  end

  def show
    puts @lru_cache.to_s
  end
end
