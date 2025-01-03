with Ada.Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO;

package body Tools is

   protected body Output is
      procedure Puts(Str: String; Num: Natural := 0) is
      begin
         Put(Str);
         if Num > 0 then
            New_Line;
         end if;
      end Puts;
   end Output;
   
   
   package body Random_Generator is
      package Gen_Pack is new Ada.Numerics.Discrete_Random(T);
      
      protected Generator is
         function GetRand return T;
         procedure Init;
         
      private 
         G: Gen_Pack.Generator;
      end Generator;
      
      
      protected body Generator is
         function GetRand return T is
         begin
            return Gen_Pack.Random(G);
         end GetRand;
         
         procedure Init is
         begin
            Gen_Pack.Reset(G);
         end Init;
      end Generator;
      
      
      function GetRandom return T is
      begin
         return Generator.GetRand;
      end GetRandom;
      
   begin
      Generator.Init;
   end Random_Generator;
end Tools;
