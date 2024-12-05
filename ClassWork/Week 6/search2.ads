generic
   type Index is (<>);
   type Elem is limited private;
   type Arr is array(Index range <>) of Elem;
   with function "="(E1: Elem; E2: Elem) return Boolean is <>;
procedure Search2(A: in Arr; B: out Boolean; I1: out Index; I2: out Index);
