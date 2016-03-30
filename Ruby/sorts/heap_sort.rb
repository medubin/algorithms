class Array
  def heapsort!
    heapify!
    unheapify!
    self
  end

  private

  def heapify!
    self.each_index do |i|
      while !!parent_idx(i) && self[i] > self[parent_idx(i)]
        swap!(i, parent_idx(i))
        i = parent_idx(i)
      end
    end
  end

  def unheapify!
    heap_length = self.length
    while heap_length > 0
      heap_length -=1
      swap!(0, heap_length)

      i = 0
      while need_to_heapify_down?(i, heap_length)
        max_child = max_child_idx(i, heap_length)
        swap!(i, max_child)
        i = max_child
      end
    end
  end

  def need_to_heapify_down?(i, heap_length)
    max_child = max_child_idx(i, heap_length)
    !!max_child && self[i] < self[max_child]
  end

  def max_child_idx(i, heap_length)
    [(2 * i) + 1, (2 * i) + 2]
    .select { |j| j < heap_length }
    .max_by { |j| self[j] }
  end

  def parent_idx(i)
    i > 0 ? (i - 1) / 2 : nil
  end

  def swap!(idx1, idx2)
    self[idx1], self[idx2] = self[idx2], self[idx1]
  end
end
