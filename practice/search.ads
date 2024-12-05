generic
   type Index is (<>);     -- Discrete type for array index
   type Element is private; -- Element type
   with function "=" (Left, Right: Element) return Boolean is <>;
   type Array_Type is array (Index range <>) of Element;
package Search is
   procedure IsThrice(A: in Array_Type; 
                     IsTrue: out Boolean;
                     First_Pos: out Index;
                     Second_Pos: out Index);
end Search;
