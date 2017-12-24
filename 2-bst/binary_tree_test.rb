gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'binary_tree'

class BinaryTreeTest < Minitest::Test
  def test_tree_from_empty_array
    tree = BinaryTree.create([])
    assert_equal nil.to_s, tree.value
    assert_nil tree.left
    assert_nil tree.right
  end

  def test_tree_from_one_element_array
    tree = BinaryTree.create([1])
    assert_equal '1', tree.value
    assert_nil tree.left
    assert_nil tree.right
  end

  def test_tree_from_7_element_array
    tree = BinaryTree.create((1..7).to_a)
    assert_equal '4', tree.value
    assert_equal '2', tree.left.value
    assert_equal '1', tree.left.left.value
    assert_nil tree.left.left.left
    assert_nil tree.left.left.right
    assert_equal '3', tree.left.right.value
    assert_nil tree.left.right.left
    assert_nil tree.left.right.right
    assert_equal '6', tree.right.value
    assert_equal '5', tree.right.left.value
    assert_nil tree.right.left.left
    assert_nil tree.right.left.right
    assert_equal '7', tree.right.right.value
    assert_nil tree.right.right.left
    assert_nil tree.right.right.right
  end
end
