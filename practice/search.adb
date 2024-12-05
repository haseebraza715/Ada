package body Search is
   procedure IsThrice(A: in Array_Type; 
                     IsTrue: out Boolean;
                     First_Pos: out Index;
                     Second_Pos: out Index) is
   begin
      IsTrue := False;  -- Initialize to False
      
      -- Check each element against all following elements
      for I in A'First..Index'Pred(A'Last) loop
         for J in Index'Succ(I)..A'Last loop
            if A(I) = A(J) then  -- Found a match
               First_Pos := I;
               Second_Pos := J;
               IsTrue := True;
               return;  -- Exit immediately when found
            end if;
         end loop;
      end loop;
   end IsThrice;
end Search;
