with Ada.Text_IO, Ada.Numerics.Discrete_Random, Ada.Calendar;
use Ada.Text_IO, Ada.Calendar;

procedure Chicken is
   
   package Rand_Bool is new Ada.Numerics.Discrete_Random(Boolean);
   use Rand_Bool;
   
   protected Gen_Rand_Bool is
      procedure Init;
      function Generate return Boolean;
   private
      G: Generator;
   end Gen_Rand_Bool;
   
   protected body Gen_Rand_Bool is
      procedure Init is
      begin
         Reset(G);
      end Init;
      
      function Generate return Boolean is
      begin
         return Random(G);
      end Generate;
   end Gen_Rand_Bool;
   
   Gone: exception;
   Fly: exception;
   
   task Chicken is
      entry Feed;
      entry Play;
   end Chicken;
   
   task body Chicken is
      SeedInStomach: Integer := 4;
      SeedDelay: Duration := 1.0;
      TimeNotPlayed: Float := 5.0;
      Now: Time := Clock;
   begin
      loop
         Now := Clock;
         if SeedInStomach <= 0 then 
            raise Gone;
         elsif SeedInStomach >= 30 then
            raise Fly;
         elsif TimeNotPlayed <= 0.0 then
            raise Gone;
         else
            select
               accept Feed  do
                  SeedInStomach := SeedInStomach + 3;
                  Put_Line("Chicken: I am getting fed: " & Natural'Image(SeedInStomach));
               end Feed;
            or
               accept Play  do
                  TimeNotPlayed := 5.0;
                  SeedInStomach := SeedInStomach - 1;
                  Put_Line("Chicken: playing with the child: " & Natural'Image(SeedInStomach));
               end Play;
            or
               delay SeedDelay;
               SeedInStomach := SeedInStomach - 1;
               Put_Line("Chicken: losing a seed: " & Natural'Image(SeedInStomach));
            end select;
         end if;
         TimeNotPlayed := TimeNotPlayed - Float(Clock - Now);
         Put_Line(Float'Image(TimeNotPlayed));
      end loop;
   exception
      when Fly => Put_Line("Chicken flew away");
      when Gone => Put_Line("Chicken died");
   end Chicken;
   
   task Child;
   
   task body Child is
      B: Boolean;
   begin
      loop
         delay 0.1;
         B := Gen_Rand_Bool.Generate;
         if B then
            Chicken.Feed;
         else
            Chicken.Play;
         end if;
      end loop;
   exception
      when Tasking_Error => Put_Line("Child is sad");
   end Child;
   
begin
   Gen_Rand_Bool.Init;
end Chicken;
