package body SetQ is

   function Numerator(R: Rational) return Integer is
   begin
      return R.Numerator;
   end Numerator;
   
      
   function Denominator(R: Rational) return Integer is
   begin
      return R.Denominator;
   end Denominator;
   
   
   function "/"(Numerator: Integer; Denominator: Positive) return Rational is
   begin
      return Normalize(Numerator, Denominator);
   end "/";
   
   
   function "/"(X, Y: Rational) return Rational is
   begin
      return Normalize(X.Numerator * Y.Denominator, X.Denominator * Y.Numerator);
   end "/";
   
   
   function "/"(X: Rational; Y: Positive) return Rational is
   begin
      return Normalize(X.Numerator, X.Denominator * Y);
   end "/";
   
   
   function "+"(X, Y: Rational) return Rational is
   begin
      return Normalize(X.Numerator * Y.Denominator + Y.Numerator * X.Denominator,
                       X.Denominator * Y.Denominator);
   end "+";
   
      
   function "*"(X, Y: Rational) return Rational is
   begin
      return Normalize(X.Numerator * Y.Numerator, X.Denominator * Y.Denominator);
   end "*";
   
   
   function Gcd(A, B: Positive) return Positive is
      X: Positive := A;
      Y: Natural := B;
      Tmp: Natural;
   begin
      while Y /= 0 loop
         Tmp := X mod Y;
         X := Y;
         Y := Tmp;
      end loop;
      return X;
   end Gcd;
   
   
   function Normalize(Numerator: Integer; Denominator: Positive) return Rational is
   begin
      if Numerator = 0 then
         return (0,1);
      else
         declare
            H: Positive := Gcd(abs(Numerator), Denominator);
         begin
            return (Numerator/H, Denominator/H);
         end;
      end if;
   end Normalize;
   
         
      
      

end SetQ;
