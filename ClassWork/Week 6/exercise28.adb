with Ada.Text_IO, Search2;
use Ada.Text_IO;

procedure Exercise28 is
   
   type Arr is array(Integer range <>) of Integer;
   
   procedure Own_Search is new Search2(Integer, Integer, Arr);
   
   A1: Arr(1..6) := (1,2,2,3,4,5);
   A2: Arr(1..5) := (1,2,3,4,5);
   
   procedure Print(A: in Arr) is
      B: Boolean;
      I1: Integer;
      I2: Integer;
   begin
      Own_Search(A, B, I1, I2);
      if B then
         Put_Line("Array contains an element that occurs 2 or more times");
         Put_Line("Index 1: " & Integer'Image(I1) & " Index 2: " & Integer'Image(I2));
      else
         Put_Line("Array does not contain an element that is repeated");
      end if;
   end Print;
   
   
begin
   
   Print(A1);
   Print(A2);
   
end Exercise28;
