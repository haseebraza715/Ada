package body BSTreeP is

   function Make_Tree(A: TArray) return BSTree is --Creates a binary search tree from an array
      NewTree: BSTree := null;
   begin
      for I in A'Range loop
         Insert(A(I), NewTree);
      end loop;
      return NewTree;
   end Make_Tree;
   
      
   procedure Insert(E: in Elem; T: in out BSTree) is -- Inserts an element in the tree
   begin
      if T /= null then
         if E < T.all.D then
            Insert(E, T.LeftT);
         else
            Insert(E, T.RightT);
         end if;
      else
         T := new Node'(E, null, null);
      end if;
   end Insert;
         
   
   --3 Traversal modes
   function PreOrder(T: in BSTree; A: in out TArray; I: in out Positive) return TArray is --root-left-right
   begin
      A(I) := T.all.D;
      I := I + 1;
      if T.LeftT /= null then
         A := PreOrder(T.LeftT, A, I);
      end if;
      if T.RightT /= null then
         A := PreOrder(T.RightT, A, I);
      end if;
      return A;
   end PreOrder;
         
      
   function InOrder(T: in BSTree; A: in out TArray; I: in out Positive) return TArray is --left-root-right
   begin
      if T.LeftT /= null then
         A := InOrder(T.LeftT, A, I);
      end if;
      A(I) := T.all.D;
      I := I + 1;
      if T.RightT /= null then
         A := InOrder(T.RightT, A, I);
      end if;
      return A;
   end InOrder;
   
   
   function PostOrder(T: in BSTree; A: in out TArray; I: in out Positive) return TArray is --left-right-root
   begin
      if T.LeftT /= null then
         A := PostOrder(T.LeftT, A, I);
      end if;
      if T.RightT /= null then
         A := PostOrder(T.RightT, A, I);
      end if;
      A(I) := T.all.D;
      I := I + 1;
      return A;
   end PostOrder;
   

end BSTreeP;
