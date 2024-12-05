package Maths is

   function Sum_Digits(N: Positive) return Positive;
   
   function Div_By_Nine(N: Positive) return Boolean;
   procedure Div_By_Nine_Print(N: in Positive);
   
   procedure Perfect_Numbers(N: in Positive);
   
   function SinX(X: Float) return Float;
   
   function Check_Palindrome(N: Positive) return Boolean;
   
   function Power_Rec(B, X: Natural) return Natural;
   
   function Fact_Rec(N: Positive) return Positive;

end Maths;
