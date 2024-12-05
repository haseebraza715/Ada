with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure CheckSign is
   
   X: Integer;
   
begin
   
   Get(X);
   
   if X > 0 then
      Put(1);
   elsif X = 0 then
      Put(0);
   else
      Put(-1);
   end if;
   
   
end CheckSign;
