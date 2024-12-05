with Ada.Text_IO, Ada.Strings.Unbounded;
use Ada.Text_IO, Ada.Strings.Unbounded;

procedure Main is

   S1: String(1..11) := "Hello World";
   S2: Unbounded_String := To_Unbounded_String("Hello World");

   type Engine_T is (Renault, Ferrari, Mercedes, Honda_RBPT);
   for Engine_T use (1,2,3,4);

begin

   Put_Line(S1);
   Put_Line(To_String(S2));

   S1(1..3) := "New";
   S2 := To_Unbounded_String("New");

   Put_Line(S1(1..11));
   Put_Line(To_String(S2));

   Put_Line(Engine_T'Image(Renault));
   Put_Line(Engine_T'Image(Engine_T'Enum_Val(3)));
   Put_Line(Integer'Image(Engine_T'Enum_Rep(Ferrari)));


end Main;
