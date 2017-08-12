class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    result = 0
    return 10 if self.flatten.empty?
    self.each_with_index do |el, idx|
      result += el * idx
    end
    result
  end
end

class String
  def hash
    result = 0
    self.chars.each_with_index do |char, idx|
      result += char.ord * idx
    end
    result
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0
    self.each do |k, v|
      result += k.to_s.ord * v.ord
    end
    result
  end
end
