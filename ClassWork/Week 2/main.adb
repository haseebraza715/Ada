with Ada.Text_IO, Maths;
use Ada.Text_IO, Maths;

procedure Main is

begin

   --Exercise 9
   Put_Line(Positive'Image(Sum_Digits(123)));

   --Exercise 10
   Div_By_Nine_Print(123);
   Div_By_Nine_Print(486);

   --Exercise 11
   Perfect_Numbers(10000);
   New_Line;

   --Exercise 12
   Put_Line(Float'Image(SinX(0.5)));

   --Exercise 13
   Put_Line(Boolean'Image(Check_Palindrome(1232)));

   --Exercise 14
   Put_Line(Positive'Image(Power_Rec(2,4)));

   --Exercise 15
   Put_Line(Positive'Image(Fact_Rec(5)));
end Main;
