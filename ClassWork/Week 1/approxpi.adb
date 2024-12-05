with Ada.Float_Text_IO;
use Ada.Float_Text_IO;

procedure ApproxPi is
   
   Pi: Float := 1.0;
   
begin
   
   for I in 1..10000 loop
      Pi := Pi * (4.0 * Float(I**2)) / (4.0 * Float(I**2) - 1.0);
   end loop;
   
   Pi := Pi * 2.0;
   
   Put(Pi);
   
end ApproxPi;
