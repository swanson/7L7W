nums = [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4]

puts "Array#each"
group = []
nums.each do |num|
  group << num
  p group.pop(4) if group.size > 3
end

puts "Enumerable#each_slice"
nums.each_slice(4) {|num| p num}

puts "#################################################"

class Tree
  attr_accessor :leaves, :name, :kids

  def initialize(leaves = {})
    @leaves = leaves
    @name = leaves.keys.first
    @kids = leaves.values.first
  end

  def visit_all(&block)
    visit &block
    @kids.each do |key, values|
      Tree.new({key => values}).visit_all &block
    end
  end

  def visit(&block)
    block.call self
  end
end

family_tree = {
  grandpa: {
    dad: {
      child_1: {},
      child_2: {}
    },
    uncle: {
      child_3: {}
    }
  }
}

Tree.new(family_tree).visit_all{|node| puts node.name}

puts "#################################################"

class PoormansGrep
  def initialize(filename)
    @filename = filename
  end

  def find(pattern)
    File.foreach(@filename).select{|line| line.include? pattern}
  end
end

p PoormansGrep.new("foo.txt").find("test")
