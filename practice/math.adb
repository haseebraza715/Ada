package body math is

function Gcd (A, B:Integer) return Integer is
begin
   return A + B;
end Gcd;


function Factorial (N: Integer) return Integer is
begin

   if N > 1 then
      return N * Factorial(N-1);
   else
      return 1;
   end if;
end Factorial;

 end math;
