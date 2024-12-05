with Ada.Text_IO;
use Ada.Text_IO;

procedure Main is

   task type Shoe is
      entry Init(S: in String := "");
   end Shoe;

   LeftShoe, RightShoe: Shoe;

   task Sand is
      entry A;
      entry B;
   end Sand;

   task body Sand is
      LSN: Boolean := True;
   begin
      loop
         select
               accept A;
               accept B;
         or
            terminate;
         end select;
      end loop;
   end Sand;

   task body Shoe is
      Type PStr is access String;
      ShoeP: PStr;
   begin
      accept Init(S: in String := "") do
         ShoeP := new String(1..S'Length);
         ShoeP.all := S;
      end Init;

      for I in 1..5 loop
         Sand.A;
         Put_Line(Integer'Image(I) & ": " & ShoeP.all);
      end loop;
   end Shoe;



begin
   --  Insert code here.
   null;
end Main;
