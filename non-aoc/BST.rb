class Node
    attr_reader :val, :parent, :left, :right
end

NodeS = Struct.new(:val, :parent, :rel_pos, :left, :right) {
    def isLeaf?
        return self.left.nil? && self.right.nil?
    end
}

class BST
    attr_reader :root
    def initialize(val)
        @root = NodeS.new(val, nil)
    end

    def height(node)
        return -1 if node.nil?

        [self.height(node.left),self.height(node.right)].max + 1
    end

    def i(val)
        self.insert(val)
    end

    def insert(val)
        parent = @root
        α = nil
        loop {
            α = val < parent.val ? :left : :right
            break if parent[α].nil?
            parent = parent[α]
        }
        parent[α] = NodeS.new(val, parent, α)
        self
    end

    def find(val)
        n = @root
        loop {
            break n if n.val == val
            break nil if n.isLeaf?
            n = val < n.val ? n.left : n.right
        }
    end

    def delete(val)
        node = self.find(val)

        if node.isLeaf?
            node.parent[node.rel_pos] = nil
            # node.parent = nil
        elsif node.left.nil?
            # if(val == 5)
            #     p node.right.val
            #     # exit
            # end
            node.parent[node.rel_pos] = node.right
            node.right.parent         = node.parent
            node.right.rel_pos        = node.rel_pos
            # node.right = nil
            # node.parent = nil
        elsif node.right.nil?
            node.parent[node.rel_pos] = node.left
            node.left.parent          = node.parent
            node.left.rel_pos         = node.rel_pos
            # node.left = nil
            # node.parent = nil
        else
            newNode = node.right
            newNode = newNode.left until newNode.left.nil?

            newNode.parent[newNode.rel_pos] = newNode.right
            newNode.right.parent = newNode.parent unless newNode.right.nil?
            newNode.right.rel_pos = newNode.rel_pos unless newNode.right.nil?

            newNode.parent  = node.parent
            newNode.rel_pos = node.rel_pos

            node.parent[node.rel_pos] = newNode

            newNode.left = node.left
            newNode.right = node.right

            node.left.parent = newNode unless node.left.nil?
            node.right.parent = newNode unless node.right.nil?

        end
        self
    end

    def fitLevel(floorLen, treeH, arr, lvl, node, order)
        return arr if node.nil?

        nodes_in_level = 2**lvl

        pad = 2**(treeH-lvl)-1
        mid_pad = (floorLen - 2*pad - nodes_in_level)
        mid_pad = mid_pad / (2**lvl-1) if mid_pad > 0

        arr[lvl][order+pad+mid_pad*order] = node.val

        fitLevel(floorLen, treeH, arr, lvl+1, node.left, order * 2)
        fitLevel(floorLen, treeH, arr, lvl+1, node.right, order * 2 + 1)

        arr
    end

    def show
        treeH    = height @root
        floorLen = 2**(treeH+1) - 1

        arr = Array.new(treeH+1) { [' '] * floorLen }
        arr = fitLevel(floorLen, treeH, arr, 0, @root, 0)

        arr.each{|row| p row.join }
    end

    def PREORDER(res, node)
        return res if node.nil?

        res << node.val
        self.PREORDER(res, node.left)
        self.PREORDER(res, node.right)
    end

    def INORDER(res, node)
        return res if node.nil?

        self.INORDER(res, node.left)
        res << node.val
        self.INORDER(res, node.right)
    end

    def POSTORDER(res, node)
        return res if node.nil?

        self.POSTORDER(res, node.left)
        self.POSTORDER(res, node.right)
        res << node.val
    end

    def BFS
        q = [@root]

        Enumerator.new { |yielder|
            until q.empty?
                cur = q.shift
                yielder << cur.val
                q << cur.left << cur.right
                q.reject!(&:nil?)
            end
        }
    end
end

T = BST.new(7)
T.i(2).i(5).i(1).i(0).i(8).i(7).i(9).i(1).i(0).i(6).i(5).i(4).i(4).i(3)
# T.delete(2)
# T.delete(4)
# T.delete(4)
# T.delete(5).delete(6).delete(5).delete(1).delete(1)
T.show
# p T.find(5).parent.val

p T.PREORDER([], T.root)
p T.INORDER([], T.root)
p T.POSTORDER([], T.root)
p T.BFS.to_a
