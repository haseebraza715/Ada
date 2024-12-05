generic
   type Index is (<>);    
   type Element is private; 
   type Array_Type is array (Index range <>) of Element;
package Reversal is
   procedure Reverse_Array(Arr: in out Array_Type);
end Reversal;
