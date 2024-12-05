package body Map is 

function Mapfunction(X: Arr1) return Arr2 is
      Y := Arr2(Arr1'Range) 
   begin
      for I in X'Range loop
         Y(I) = Op(X(I));
      end loop;
      return Y;
   end Mapfunction;
end Map;
