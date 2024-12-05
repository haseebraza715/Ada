with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure MaxThree is
   
   A: Integer;
   B: Integer;
   C: Integer;
   
begin
   
   Get(A);
   Get(B);
   Get(C);
   
   if A>= B and A >= C then
      Put(A);
   elsif B >= A and B >= C then
      Put(B);
   else
      Put(C);
   end if;
   
   
end MaxThree;
