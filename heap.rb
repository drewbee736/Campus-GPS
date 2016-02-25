class MinHeap

	def initialize
		@heap = []
	end

	def push(element)
		@heap << element
		perc_up
	end

	def pop
		swap(0, @heap.length - 1)
		temp = @heap.pop
		perc_down
		return temp
	end

	def top
		@heap[0]
	end

	def is_empty?
		return true if @heap.length == 0
		false
	end

	def perc_up
		ptr = @heap.length - 1
		while ptr > 0 do
			break if @heap[ptr][0] >= @heap[(ptr-1)/2][0]
			swap(ptr, (ptr - 1) / 2)
			ptr = (ptr - 1) / 2
		end
	end

	def perc_down
		ptr = 0
		while ptr * 2 + 1 < @heap.length do
			less_index = ptr * 2 + 2
			less_index -= 1 if less_index >= @heap.length or @heap[less_index - 1][0] < @heap[less_index][0]
			break if @heap[ptr][0] <= @heap[less_index][0]
			swap(ptr, less_index)
			ptr = less_index
		end
	end

	def swap(a, b)
		temp = @heap[a]
		@heap[a] = @heap[b]
		@heap[b] = temp
	end

	private :perc_up, :perc_down, :swap
end
