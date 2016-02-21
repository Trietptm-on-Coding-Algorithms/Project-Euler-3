# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

require 'set'

# This implements an optimised version of the sieve of Eratosthenes.
# https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes#Overview
def prime_sieve(n)
	primes = [nil, nil] + (2..n).to_a

	primes.each do |p|
		next unless p
		break if p * p > n

		(p * p).step(n, p) { |i| primes[i] = nil }
	end

	primes.compact!
end

# This implements trial division, returning an array of prime factors for a given natural number.
# https://en.wikipedia.org/wiki/Trial_division
def trial_division(n)
	return [] if n < 2

	prime_factors = Set.new
	n_sqrt        = Integer(Math.sqrt(n))
	sieve_list    = prime_sieve(n_sqrt + 1)

	for p in sieve_list
		break if p * p > n

		while n % p == 0
			prime_factors.add(p)
			n /= p
		end
	end

	prime_factors.add(n) if n > 1
	prime_factors.to_a
end

abort('Usage: ruby 3.rb [natural_num]') unless ARGV[0]
ARGV[0] = Integer(ARGV[0].tr(',', ''))

prime_factors = trial_division(ARGV[0])
puts prime_factors.any? ? prime_factors.last : 'Solution not found.'

# Output
# ---------------------------------------------------
# phizo@jizzo ~/C/P/Ruby> time ruby 3.rb 600851475143
# 6857
#         0.24 real         0.21 user         0.01 sys
