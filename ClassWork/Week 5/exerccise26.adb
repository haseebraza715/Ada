with Ada.Text_IO, Reversal1;
use Ada.Text_IO;

procedure Exerccise26 is

   type Arr is array(Integer range <>) of Integer;
   
   procedure Swap(X, Y: in out Integer) is
      Tmp: Integer := X;
   begin
      X := Y;
      Y := Tmp;
   end Swap;
   
   procedure My_Reversal is new Reversal1(Index => Integer, Elem => Integer, T => Arr, Swap => Swap);
   
   A1: Arr := (1,2,3,4,5,6);
   
   procedure Print(A: in Arr) is
   begin
      for I in A'Range loop
         Put_Line(Integer'Image(A(I)));
      end loop;
   end Print;
   
   
begin
   
   My_Reversal(A1);
   Print(A1);
   
end Exerccise26;
