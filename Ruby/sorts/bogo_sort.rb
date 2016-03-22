class Array
  def bogo_sort!(&prc)
    prc ||= Proc.new { |x, y| x <=> y }
    sorted = false
    until sorted
      sorted = true
      self[0..-2].each_index do |idx|
        if prc.call(self[idx], self[idx+1]) == 1
          sorted = false
          break
        end
      end
      self.shuffle! unless sorted
    end
    self
  end
end
