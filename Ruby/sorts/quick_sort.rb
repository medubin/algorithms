class Array
  def quick_sort!(&prc)
    prc ||= Proc.new { |x, y| x <=> y }
    return self if self.length <= 1
    pivot = self[0]
    left, right = [], []

    self[1..-1].each do |el|
      if prc.call(el, pivot) == -1
        left << el
      else
        right << el
      end
    end
    left.quick_sort!(&prc) + [pivot] + right.quick_sort!(&prc)
  end
end



p [0,1,5,2,6,8,1,55,1].quick_sort!
