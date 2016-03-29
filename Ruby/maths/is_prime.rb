def is_prime? num
  2.upto(num / 2) do |i|
    return false if num % i == 0
  end
  true
end
