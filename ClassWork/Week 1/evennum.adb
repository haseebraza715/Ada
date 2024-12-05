with Ada.Integer_Text_IO, Ada.Text_IO;
use Ada.Integer_Text_IO, Ada.Text_IO;

procedure EvenNum is
   
   N: Integer;
   
begin
   
   Get(N);
   
   if N mod 2 = 0 then
      Put_Line("Even");
   else
      Put_Line("Odd");
   end if;
   
   
end EvenNum;
