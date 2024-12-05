with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;


--n choose k formula:
-- (n)        n!
--        = ---------
-- (k)      k!(n-k)!


procedure NChooseK is
   
   N: Integer;
   K: Integer;
   R: Integer := 1;
   
   function Factorial(N: Integer) return Positive is
      Fact: Positive := 1;
   begin
      for I in 1..N loop
         Fact := Fact * I;
      end loop;
      return Fact;
   end Factorial;
   
begin
   
   Get(N);
   Get(K);
   
   --R := Factorial(N) / ( Factorial(K) * Factorial(N-K) );
   
   --Put(R);
   
   for I in 1..K loop
      R := R * (N + 1 - I) / I;
   end loop;
   
   Put(R);
   
end NChooseK;
