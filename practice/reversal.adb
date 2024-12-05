With Swap;
package body Reversal is
   procedure Reverse_Array(Arr: in out Array_Type) is
      First_Idx: Index := Arr'First;
      Last_Idx: Index := Arr'Last;
      package  My_Swap is new Swap(Element);
      use My_Swap;
   begin
      while First_Idx < Last_Idx loop
         Swaap(Arr(First_Idx), Arr(Last_Idx));
         
         -- Move indices toward center
         First_Idx := Index'Succ(First_Idx);
         Last_Idx := Index'Pred(Last_Idx);
      end loop;
   end Reverse_Array;
end Reversal;
