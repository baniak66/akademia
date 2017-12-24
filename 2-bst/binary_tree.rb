require 'bundler'

Bundler.require(:default)

class BinaryTree
  attr_reader :left
  attr_reader :right
  attr_reader :value

  def initialize(left, right, value)
    @left = left
    @right = right
    @value = value.to_s
  end

  def self.build_node(array)
    if array.empty?
      nil
    else
      mid = array[array.length / 2]
      left_arr, right_arr = array.partition { |el| el < mid }
      right_arr = right_arr.drop(1)
      BinaryTree.new(
        BinaryTree.build_node(left_arr),
        BinaryTree.build_node(right_arr),
        mid
      )
    end
  end

  def self.create(array)
    return BinaryTree.new(nil,nil,nil) if array.empty?
    build_node(array.sort)
  end

  def generate_graph_tree
    graph = GraphViz.new(:G, type: :graph)
    generate_graph_subtree(graph)
    graph
  end

  def generate_graph_subtree(graph)
    this_node = graph.add_nodes(value)
    if left
      left_node = left.generate_graph_subtree(graph)
      graph.add_edges(this_node, left_node)
    end
    if right
      right_node = right.generate_graph_subtree(graph)
      graph.add_edges(this_node, right_node)
    end
    this_node
  end

  def print_tree(file)
    generate_graph_tree.output(png: file)
  end
end
