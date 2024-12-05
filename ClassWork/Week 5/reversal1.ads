generic
   type Elem is limited private;
   type Index is (<>);
   type T is array(Index range <>) of Elem;
   with procedure Swap(X, Y: in out Elem);
procedure Reversal1(A: in out T);
