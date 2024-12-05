package body Element is
   
   procedure Set (E:T) is
   begin
      Value := E;
      Valid := True;
   
end Set;
   
   procedure Reset is
   begin
      Valid := False;
      
   end Reset;
   
   function IsValid return Boolean is
begin
   return Valid;
end isValid;
   

end Element;
