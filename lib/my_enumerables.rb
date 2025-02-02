module Enumerable
  # Your code goes here
  def my_each_with_index
    self.length.times {|i| yield(self[i], i)} 
    self
  end
  def my_select
    selectedArr = []
    self.my_each_with_index { |elem, i| selectedArr << elem if yield(elem, i) }
    return selectedArr
  end
  def my_all?
    self.my_each {|i| return false unless yield(i)}
    return true
  end

  def my_any?
    self.my_each { |i| return true if yield(i) }
    return false
  end
  def my_none?
    self.my_each {|elem| return false if yield(elem) }
    return true
  end
  def my_count
    return self.length if !block_given?  
    count = 0
    self.my_each() { |elem| count += 1 if yield(elem)}
    count
  end
  def my_map
    mappedArr = []
    self.my_each { |elem| mappedArr << yield(elem)}
    mappedArr
  end
  def my_inject(value = 0)
    self.my_each { |elem| value = yield(value, elem) }
    value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each()
    self.length.times { |i| yield(self[i]) }
    self
  end
end

arr = [5, 3, 2, 1, 2]
p arr.my_inject() {|value, num| value += num}
