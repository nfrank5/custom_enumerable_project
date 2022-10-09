module Enumerable
  # Your code goes here
  def my_each_with_index
    index = -1
    self.my_each do |e|
      index +=1
      yield(e, index)
    end
    self
  end

  def my_select
    selection = []
    self.my_each do |e|
      selection.push e if yield e
    end
    selection
  end


  def my_all?
    self.my_each do |e|
      return false unless yield e
    end
    true
  end

  def my_any?
    self.my_each do |e|
      return true if yield e
    end
    false
  end

  def my_none?
    self.my_each do |e|
      return false if yield e
    end
    true
  end


  def my_count
    count = 0
    if block_given?
      self.my_each do |e|
        count += 1 if yield e
      end
    else
      count = self.length
    end
    count
  end

  def my_map
    arr = []
    self.my_each do |e|
      arr.push(yield e)
    end
    arr
  end

  def my_inject(initial_value = 0)
    self.my_each do |e|
      initial_value = yield initial_value, e
    end
    initial_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each()
    for e in self do
      yield e
    end
    self
  end
end
