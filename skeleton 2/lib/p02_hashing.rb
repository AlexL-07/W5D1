# class Integer
#   # Integer#hash already implemented for you

# end

# class Array
#   def hash
#     return 0.hash if self == [] # hardcoded stuff 
#     sum = 0 
#     self.each do |num| 
#       sum += num.hash
#     end
#     sum / (self[0] + 5) 
#   end
# end

# class String
#   def hash
#     alphabet = ("a".."z").to_a + ("A".."Z").to_a
#     arr = []
#     self.each_char do |char|
#       arr << alphabet.index(char)
#     end
#     arr.hash
#   end
# end

# class Hash
#   # This returns 0 because rspec will break if it returns nil
#   # Make sure to implement an actual Hash#hash method
#   def hash
#     sorted_hash = self.sort_by{|k,v| v}
#     sorted_hash.map! do |arr| 
#       [arr[0].to_s.hash, arr[1].hash].sum 
#     end
    
#     sorted_hash.sum 
#   end
# end
