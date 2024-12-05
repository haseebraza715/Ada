package body lines is

   procedure Hiext(Q: in out Queue; E : in Elem) is
   begin 
      Q.Adatok(Q.Putter) := E;
      Q.Putter := (Q.Putter mod Q.Max) + 1;
      Q.Size := Q.Size + 1;
   end Hiext;
   
   
   
   procedure Lopop(Q: in out Queue; E : out Elem) is
   begin
      
      E := Lov(Q);
      Q.Getter := (Q.Getter mod Q.Max) + 1;
      Q.Size := Q.Size - 1;
   end Lopop;
   
      
   
   function Lov(S:Queue) return Elem is 
      return S.Adatok(S.Getter);
   
   function Is_Empty(S: Queue) return Boolean is
      
   begin 
      if Size(S) = 0 then 
           return True;
      else
         return False;
      end if;
      
   end Is_Empty;
   
      
      
   function Is_Full(S: Queue) return Boolean is
      begin
         if Size(S) = S.Max then 
            return True;
         else
            return False;
         end if;
      end Is_Full;
      
         
         
   
   function Size (S:Queue) return Natural is 
   begin
      return S.Size;
      
end Size;

end lines;
