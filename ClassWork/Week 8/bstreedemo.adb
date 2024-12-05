with Ada.Text_IO, BSTreeP;
use Ada.Text_IO;

procedure BSTreeDemo is
   
   package My_BSTree is new BSTreeP(Integer);
   use My_BSTree;
   
   A: TArray := (9,11,29,14,2,34,12,192,19,10);
   SortedA: TArray(A'Range);
   
   I: Integer := 1;
   BST: BSTree;
   
   procedure PrintA(Arr: TArray) is
   begin
      for I in Arr'Range loop
         Put(Integer'Image(Arr(I)));
      end loop;
   end PrintA;
   
begin
   
   Put_Line("Array at the start");
   PrintA(A);
   New_Line(2);
   BST := Make_Tree(A);
   
   Put_Line("PreOrder visit");
   PrintA(PreOrder(BST, SortedA, I));
   New_Line;
   I := 1;
   
   Put_Line("InOrder visit");
   PrintA(InOrder(BST, SortedA, I));
   New_Line;
   I := 1;
   
   Put_Line("PostOrder visit");
   PrintA(PostOrder(BST, SortedA, I));
   New_Line;
   I := 1;
   
end BSTreeDemo;
