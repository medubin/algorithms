class Array
  def bubble_sort!(&prc)
    prc ||= Proc.new { |x, y| x <=> y }
    sorted = false
    until sorted
      sorted = true
      self[0..-2].each_index do |idx|
        j = idx + 1
        if prc.call(self[idx],self[j] ) == 1
          self[j],self[idx] = self[idx],self[j]
          sorted = false
        end
      end
    end
    self
  end
end
