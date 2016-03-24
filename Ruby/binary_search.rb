class Array
  def binary_search(target)
    mid = self.length/2
    return mid if self[mid] === target
    return nil if self.length <= 1
    left = self.take(mid)
    right = self.drop(mid)

    if self[mid] > target
      return left.binary_search(target)
    else
      search = right.binary_search(target)
      search ? mid + search : nil
    end
  end
end
