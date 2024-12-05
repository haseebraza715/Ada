generic
   type Elem is private;
   with function "<"(A, B: Elem) return Boolean is <>;
package BSTreeP is

   type BSTree is private;
   type TArray is array(Positive range <>) of Elem;
   
   function Make_Tree(A: TArray) return BSTree; --Creates a binary search tree from an array
   procedure Insert(E: in Elem; T: in out BSTree); -- Inserts an element in the tree
   
   --3 Traversal modes
   function PreOrder(T: in BSTree; A: in out TArray; I: in out Positive) return TArray; --root-left-right
   function InOrder(T: in BSTree; A: in out TArray; I: in out Positive) return TArray; --left-root-rigth
   function PostOrder(T: in BSTree; A: in out TArray; I: in out Positive) return TArray; --left-right-root
   
private
   
   type Node;
   type BSTree is access Node;
   
   type Node is record
      D: Elem;
      LeftT, RightT: BSTree;
   end record;

end BSTreeP;
