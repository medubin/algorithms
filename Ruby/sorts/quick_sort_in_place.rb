def quicksort(arr, low_idx = 0, high_idx = (arr.length - 1))
  if low_idx < high_idx
    new_pivot_idx = partition(arr, low_idx, high_idx)
    quicksort(arr, low_idx, new_pivot_idx - 1)
    quicksort(arr, new_pivot_idx + 1, high_idx)
  end
end

def partition(arr, low_idx, pivot_idx)
  pivot = arr[pivot_idx]
  while low_idx < pivot_idx do
    if arr[low_idx] < pivot
      low_idx += 1
    else
      arr[pivot_idx], arr[pivot_idx - 1] = arr[pivot_idx - 1], arr[pivot_idx]
      if low_idx + 1 != pivot_idx
        arr[low_idx], arr[pivot_idx] = arr[pivot_idx], arr[low_idx]
      end
      pivot_idx -= 1
    end
  end
  pivot_idx
end
