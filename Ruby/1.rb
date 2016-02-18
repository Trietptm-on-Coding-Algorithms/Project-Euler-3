# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

abort('Usage: ruby 1.rb [upper_bound]') unless ARGV[0]
p (1...Integer(ARGV[0])).to_a.select { |i| i % 3 == 0 || i % 5 == 0 }.inject(:+)

# Output
# ----------------------------------------------------
# phizo@jizzo ~/C/P/Ruby> time ruby 1.rb 1000
# 233168
#         0.05 real         0.04 user         0.00 sys
