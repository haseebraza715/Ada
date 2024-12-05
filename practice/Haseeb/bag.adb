package body bag is

   procedure Insert_One(B : in out Bag_Type; E : Element_Type) is
    begin
        if B.Size < B.Max then
            B.Elements(E) := B.Elements(E) + 1;
            B.Size := B.Size + 1;
    
        end if;
   end Insert_One;
   
    procedure Insert_Multiple(B : in out Bag_Type; E : Element_Type; Count : Natural) is
    begin
        if B.Size + Count <= B.Max then
            B.Elements(E) := B.Elements(E) + Count;
            B.Size := B.Size + Count;
        
      end if;
   end Insert_Multiple;
   
   function Extract_One(B : in out Bag_Type; E : Element_Type) return Boolean is
    begin
        if B.Elements(E) > 0 then
            B.Elements(E) := B.Elements(E) - 1;
            B.Size := B.Size - 1;
            return True;
        else
            return False;
        end if;
   end Extract_One;
   
   procedure Extract_Multiple(B : in out Bag_Type; E : Element_Type; Count : Natural) is
    begin
        if B.Elements(E) >= Count then
            B.Elements(E) := B.Elements(E) - Count;
            B.Size := B.Size - Count;
        else
            B.Size := B.Size - B.Elements(E);
            B.Elements(E) := 0;
        end if;
   end Extract_Multiple;
   
    function Is_Empty(B : Bag_Type) return Boolean is
    begin
        return B.Size = 0;
   end Is_Empty;
   
   function Get_Size(B : Bag_Type) return Natural is
    begin
        return B.Size;
    end Get_Size;

   
   

end bag;
