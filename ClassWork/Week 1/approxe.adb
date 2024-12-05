with Ada.Float_Text_IO;
use Ada.Float_Text_IO;

procedure ApproxE is
   
   function Factorial(N: Integer) return Positive is
      Fact: Positive := 1;
   begin
      for I in 1..N loop
         Fact := Fact * I;
      end loop;
      return Fact;
   end Factorial;
   
   E: Float := 1.0;
   
begin
   
   for I in 1..12 loop
      E := E + (1.0 / Float(Factorial(I)));
   end loop;
   
   Put(E);
   
end ApproxE;
