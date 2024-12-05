with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Search;

procedure Main is
   -- Define array type for integers
   type Int_Array is array (Positive range <>) of Integer;

   -- Instantiate the generic package for Integer array
   package Int_Search is new Search(Positive, Integer, "=", Int_Array);
   use Int_Search;

   -- Test array
   Test_Array: Int_Array := (1, 2, 3, 2, 5);  -- 2 appears twice
   Found: Boolean;
   Pos1, Pos2: Positive;

begin
   -- Test for duplicate elements
   IsThrice(Test_Array, Found, Pos1, Pos2);

   if Found then
      Put_Line("Found duplicate element " &
              Integer'Image(Test_Array(Pos1)) &
              " at positions" &
              Positive'Image(Pos1) & " and" &
              Positive'Image(Pos2));
   else
      Put_Line("No duplicate elements found");
   end if;
end Main;
