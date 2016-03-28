def fibonacci(n)
  fibs = [0,1]
  return fibs.take(n) if n <= 2
  until fibs.length == n
    fibs << (fibs[-1] + fibs[-2])
  end
  fibs
end
