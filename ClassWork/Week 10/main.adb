with Ada.Text_IO;
use Ada.Text_IO;

procedure Main is

   task type Person is
      entry Init(S: in String := "");
   end Person;

   A, B: Person;

   protected Print is
      entry P(S: in String);
   private
      Count: Natural := 0;
   end Print;

   protected body Print is
      entry P(S: in String) when True is
      begin
         Put_Line(S & " " & Integer'Image(Count));
         Count := Count + 1;
      end P;
   end Print;

   task body Person is
      type PStr is access String;
      Name: PStr;
   begin
      accept Init (S : in String := "") do
         Name := new String'(S);
      end Init;

      for I in Positive'Range loop
         Print.P(Name.all);
      end loop;
   end Person;


   task Print2 is
      entry P(S: in String);
   end Print2;

   task body Print2 is
      Count: Natural := 0;
   begin
      loop
         accept P (S : in String) do
            Put_Line(S & " " & Integer'Image(Count));
            Count := Count + 1;
         end P;
      end loop;
   end Print2;

   task type Person2 is
      entry Init(S: in String := "");
   end Person2;

   task body Person2 is
      type PStr is access String;
      Name: PStr;
   begin
      accept Init (S : in String := "") do
         Name := new String'(S);
      end Init;

      for I in Positive'Range loop
         Print2.P(Name.all);
      end loop;
   end Person2;

   C, D: Person2;


begin
   C.Init("John");
   D.Init("Mary");
end Main;
