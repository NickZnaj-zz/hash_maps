class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash_number = 1
    self.each_with_index do |num, idx|
      hash_number *= (num.hash + idx)
    end
    hash_number
  end
end

class String
  def hash

    letters = self.split("").map { |let| let.ord }
    letters.hash
  end
end

class Hash
  def hash
    hash_number = 1
    hash_array = self.sort
    hash_array.each_with_index do |arr, idx|
      key = arr[0]
      value = arr[1]
      hash_number *= (key.hash + idx) * (value.hash + idx + 1)
    end
    hash_number

  end
end
