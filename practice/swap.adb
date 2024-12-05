package body Swap is

   procedure Swaap(A , B: in out Element ) is 
      Temp : Element ;
   begin 
      Temp := A;
      A := B;
      B:= Temp;
   end Swaap;
   


end Swap;
