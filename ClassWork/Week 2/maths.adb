with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics, Ada.Numerics.Elementary_Functions;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics, Ada.Numerics.Elementary_Functions;

package body Maths is

   --Exercise 9
   function Sum_Digits(N: Positive) return Positive is
      X: Positive := N;
      Sum: Integer := 0;
   begin
      while X >= 10 loop
         Sum := Sum + (X mod 10);
         X := X /10;
      end loop;
      Sum := Sum + (X mod 10);
      return Sum;
   end Sum_Digits;
   
   --Exercise 10
   function Div_By_Nine(N: Positive) return Boolean is
   begin
      if (Sum_Digits(N) mod 9) = 0 then
         return True;
      else
         return False;
      end if;
   end Div_By_Nine;
   
   --Exercise 10 Printing
   procedure Div_By_Nine_Print(N: in Positive) is
   begin
      if Div_By_Nine(N) then
         Put_Line(Positive'Image(N) & " is divisible by nine");
      else
         Put_Line(Positive'Image(N) & " is not divisible by nine");
      end if;
   end Div_By_Nine_Print;
   
   --Exercise 11
   procedure Perfect_Numbers(N: in Positive) is
      S: Natural;
   begin
      for I in 1..N loop
         S := 0;
         for J in 1..I-1 loop
            if I mod J = 0 then
               S := S + J;
            end if;
         end loop;
         if S = I then
            Put(I);
         end if;
      end loop;
   end Perfect_Numbers;
   
   --Exercise 12
   function SinX(X: Float) return Float is
      Y: Float := Ada.Numerics.E;
   begin
      return Sin(X); --> Return Radians
   end SinX;
   
   
   --Exercise 13
   function Check_Palindrome(N: Positive) return Boolean is
      Temp: Integer := N;
      Rev: Integer := 0;
   begin
      while Temp > 0 loop
         Rev := Rev * 10 + Temp mod 10;
         Temp := Temp / 10;
      end loop;
      return N = Rev;
   end Check_Palindrome;
   
   --Exercise 14
   function Power_Rec(B, X: Natural) return Natural is
   begin
      if X = 0 then
         return 1;
      elsif B = 0 then
         return 0;
      else
         return B * Power_Rec(B, X - 1);
      end if;
   end Power_Rec;
   
   
   --Exercise 15
   function Fact_Rec(N: Positive) return Positive is
   begin
      if N > 1 then
         return N * Fact_Rec(N-1);
      else
         return 1;
      end if;
   end Fact_Rec;
   
   

end Maths;
