require './lib/heap'

class CampusMap

	def load(filename1, filename2)
		@graph = DirectedGraph.new
		count = 1001
		File.foreach(filename1) do |line|
			name = line.strip()
			@graph.add_node(Node.new(count, name))
			@graph.add_mapping(name, count)
			count += 1
		end
		File.foreach(filename2) do |line|
			_start, _end, _distance = line.split("\t")
			@graph.add_edge(_start.to_i, _end.to_i, _distance.to_i)
		end

		#(1001..1063).each{|i| @graph.rename_node(i, )}
		#@graph.rename_node(1001, "volen")
		#@graph.rename_node(1002, "ziv 127")
		#@graph.rename_node(1000, "gzang")
	end

	def get_node_id(name)
		return @graph.get_node_id(name)
	end

	def solve(start_id, end_id)
		ret = ""
		paths = @graph.shortest_path(start_id, end_id)
		return false if paths == false
		total_distance = 0
		paths.each do |p_id, s_id, distance|
			if p_id == start_id
				ret += "Leave #{@graph.get_node_name(p_id)}<br>"
			elsif s_id == end_id
				ret += "Enter #{@graph.get_node_name(s_id)}<br>"
			else
				ret += "From #{@graph.get_node_name(p_id)} to #{@graph.get_node_name(s_id)}, distance #{distance}<br>"
				total_distance += distance
			end
		end
		ret += "Total distance: #{total_distance}<br>"
		return ret
	end

end

class DirectedGraph

	def initialize
		@nodes = {}
		@name_to_id = {}
		#@name_to_id["volen"] = 1001
		#@name_to_id["ziv 127"] = 1002
		#@name_to_id["gzang"] = 1000
	end

	def add_mapping(name, id)
		@name_to_id[name] = id
	end

	def add_node(node)
		@nodes[node.id] = node
	end

	def get_node_name(id)
		return @nodes[id].name if @nodes[id].name != "Default"
		return id if @nodes[id].name == "Default"
	end

	def get_node_id(name)
		@name_to_id[name]
	end

	def rename_node(node_id, name)
		@nodes[node_id].rename(name)
	end

	def add_edge(predecessor_id, successor_id, weight)
		add_node(Node.new(predecessor_id)) if not @nodes.has_key?(predecessor_id)
		add_node(Node.new(successor_id)) if not @nodes.has_key?(successor_id)
		@nodes[predecessor_id].add_edge(@nodes[successor_id], weight)
	end

	def shortest_path(start_id, end_id)
		distance = {}
		visited = {}
		predecessor = {}
		@nodes.keys.each do |node_id|
			distance[node_id] = Float::INFINITY
		end
		minheap = MinHeap.new
		minheap.push([0, start_id])
		distance[start_id] = 0.0
		while not minheap.is_empty? do
			curr_node = @nodes[(minheap.pop)[1]]
			break if curr_node.id == end_id
			next if visited.has_key?(curr_node.id)
			visited[curr_node.id] = true
			curr_node.iter.each do |next_node, weight|
				if distance[next_node.id] > distance[curr_node.id] + weight
					distance[next_node.id] = distance[curr_node.id] + weight
					minheap.push([distance[next_node.id], next_node.id])
					predecessor[next_node.id] = [curr_node.id, weight]
				end
			end
		end
		return false if curr_node.id != end_id
		paths = []
		ptr = end_id
		while ptr != start_id do
			paths.unshift [predecessor[ptr][0], ptr, predecessor[ptr][1]]
			ptr = predecessor[ptr][0]
		end
		return paths
	end

end

class Node

	attr_reader :id, :name

	def initialize(id, name = "Default")
		@id = id
		@name = name
		@successors = []
	end

	def rename(name)
		@name = name
	end

	def add_edge(successor, weight)
		@successors << [successor, weight]
	end

	def iter
		return @successors
	end

end

#map = CampusMap.new()
#map.load("buildings.txt", "paths.txt")
#i = map.get_input("start")
#j = map.get_input("end")
#map.solve(i, j)
