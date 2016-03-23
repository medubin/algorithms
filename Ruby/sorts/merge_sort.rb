class Array
  def merge_sort(&prc)
    return self if self.length <= 1
    prc ||= Proc.new { |x, y| x <=> y }
    midpoint = self.length/2
    left,right = self.take(midpoint), self.drop(midpoint)

    Array.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
  end


private
  def self.merge(left, right, &prc)
    merged_arr = []
    until left.empty? || right.empty?
      if prc.call(left.first, right.first) == -1
        merged_arr << left.shift
      else
        merged_arr << right.shift
      end
    end
    merged_arr + left + right
  end
end
