generic
   type Index is (<>);
   type A is private;
   type B is private;
   type Arr1 is  array(Index range <>) of A;
   type Arr2 is  array(Index range <>) of B;
   with function Op(X:A) return B;
function Mapfunction(X: Arr1) return Arr2;
