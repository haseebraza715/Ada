generic
   type Index is (<>);
   type Elem is private;
   type Arr is array(Index range <>) of Elem;
procedure Search(A: in Arr; B: out Boolean; I1: out Index; I2: out Index);
