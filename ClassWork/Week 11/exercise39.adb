with HauntedHouse, Tools;
use HauntedHouse, Tools;

procedure Exercise39 is
   
   task King is
      entry Help(H: out Boolean);
   end King;
   
   task body King is
      package Rand_Bool is new Tools.Random_Generator(Boolean);
      Val: Boolean;
   begin
      loop
         select
            accept Help (H : out Boolean) do
               Val := Rand_Bool.GetRandom;
               H := Val;
               if Val then
                  Output.Puts("The king helped the Princess", 1);
               end if;
            end Help;
         or
            terminate;
         end select;
      end loop;
   end King;
   
   
   task Princess is
      entry Frightens(Pos: Position; Num: Positive);
   end Princess;
   
   task body Princess is
      Current_Pos: Position := (1,3);
      Lives: Natural := 3;
      H: Boolean := False;
      
      type Direction is (Left, Right, Up, Down);
      package Dir_Generator is new Tools.Random_Generator(Direction);
      
      procedure Step is
         Tmp_Pos: Position;
         Dir: Direction;
      begin
         loop
            Tmp_Pos := Current_Pos;
            Dir := Dir_Generator.GetRandom;
            case Dir is
               when Left => Tmp_Pos.Y := Current_Pos.Y - 1;
               when Right => Tmp_Pos.Y := Current_Pos.Y + 1;
               when Up => Tmp_Pos.X := Current_Pos.X - 1;
               when Down => Tmp_Pos.X := Current_Pos.X + 1;
            end case;
            exit when HauntedHouse.IsCorrect(Tmp_Pos);
         end loop;
         Current_Pos := Tmp_Pos;
      end Step;
      
      procedure Startled(Num: Positive) is
      begin
         Lives := Lives - 1;
         Output.Puts("*****Got scared by Ghost " & Positive'Image(Num) & "!***** Lives: " & Natural'Image(Lives), 1);
      end Startled;
      
   begin
      loop
         
         Output.Puts("Princcess: (" & Positive'Image(Current_Pos.X) & "," & 
                       Positive'Image(Current_Pos.Y) & "): " & Fields'Image(GetField(Current_Pos)), 1);
         select
            when GetField(Current_Pos) /= R => accept Frightens (Pos : in Position; Num : in Positive) do
                  if Pos = Current_Pos then
                     Startled(Num);
                     if Lives = 1 then
                        King.Help(H);
                        if H then
                           Lives := Lives + 1;
                           H := False;
                        end if;
                     end if;
                  end if;
               end Frightens;
         or
            delay 1.0;
            Output.Puts("Princess can't be scared right now");
            
         end select;
         Step;
         exit when Lives < 1 or GetField(Current_Pos) = E;
      end loop;
      if Lives < 1 then
         Output.Puts("Scared to death.", 1);
      else
         Output.Puts("Exit!", 1);
      end if;
   exception
      when others => Output.Puts("Error with Princess.", 1);
   end Princess;
      
   
   type Dur_Ptr is access Duration;
   
   task type Ghost(Ghost_Num: Positive; Wait_Time: Dur_Ptr);
   
   task body Ghost is
      Current_Pos: Position;
   begin
      while Princess'Callable loop
         Current_Pos := HauntedHouse.GetRandPos;
         Output.Puts("Ghost: (" & Positive'Image(Current_Pos.X) & "," & 
                       Positive'Image(Current_Pos.Y) & "): " & Fields'Image(GetField(Current_Pos)) & " Boo!", 1);
         if Princess'Callable then
            Princess.Frightens(Current_Pos, Ghost_Num);
         end if;
         delay 0.2;
      end loop;
   exception
      when Tasking_Error => Output.Puts("Ghost has no one to scare", 1);
      when others => Output.Puts("Problem with Ghost", 1);
   end Ghost;
      
   
   task type Wizard(Num_Ghosts: Positive; Wait_Time: access Duration);
   
   task body Wizard is
      type Ghost_Ptr is access Ghost;
      Ptr: Ghost_Ptr;
      Dur: Dur_Ptr;
   begin
      for I in 1..Num_Ghosts loop
         delay Wait_Time.all;
         Dur := new Duration'(Duration(I) * Wait_Time.all);
         Ptr := new Ghost(I, Dur);
      end loop;
   end Wizard;
   
   Gandalf: Wizard(9, new Duration'(0.2));
   
begin
   null;
end Exercise39;
