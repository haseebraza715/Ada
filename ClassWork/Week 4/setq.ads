package SetQ is

   type Rational is private;
   
   function Numerator(R: Rational) return Integer;
   function Denominator(R: Rational) return Integer;
   
   function "/"(Numerator: Integer; Denominator: Positive) return Rational;
   function "/"(X, Y: Rational) return Rational;
   function "/"(X: Rational; Y: Positive) return Rational;
   
   function "+"(X, Y: Rational) return Rational;
   function "*"(X, Y: Rational) return Rational;
   
private
   
   function Gcd(A, B: Positive) return Positive;
   function Normalize(Numerator: Integer; Denominator: Positive) return Rational;
   
   type Rational is record
      Numerator: Integer := 0;
      Denominator: Positive := 1;
   end record;

end SetQ;
