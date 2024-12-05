package bag is

   
   subtype Element_Type is Integer ;

    type Bag_Type(Max : Natural) is private;

    procedure Insert_One(B : in out Bag_Type; E : Element_Type);
    procedure Insert_Multiple(B : in out Bag_Type; E : Element_Type; Count : Natural);
    function Extract_One(B : in out Bag_Type; E : Element_Type) return Boolean;
    procedure Extract_Multiple(B : in out Bag_Type; E : Element_Type; Count : Natural);
    function Is_Empty(B : Bag_Type) return Boolean;
    --procedure Print(B : Bag_Type);
    function Get_Size(B : Bag_Type) return Natural;

private
    type TArray is array( Integer range <> ) of Element_Type;

    type Bag_Type(Max : Natural) is record
        Elements: TArray(1..Max);
        Size     : Natural := 0;
    end record;

end bag;
