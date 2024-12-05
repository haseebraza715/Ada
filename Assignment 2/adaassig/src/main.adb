with Ada.Text_IO; use Ada.Text_IO;
with Driver_Pkg; use Driver_Pkg;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Numerics.Float_Random;
use Ada.Numerics.Float_Random;

procedure Main is

   subtype Index_Type is Integer range 1..20;
   type Driver_Array is array (Index_Type) of Driver;

   -------------------
   -- Race_Control  --
   -------------------
   task Race_Control is
      entry Init(Arr : Driver_Array; Total_Laps : Positive);
      entry Lap_Completed(D : Driver; Lap_Number : Positive; Lap_Time : Duration);
   end Race_Control;

   ---------------------
   -- Rand_Lap_Time    --
   ---------------------
   protected Rand_Gen is
      procedure Init;
      function Get_Lap_Time return Duration;
   private
      G : Generator;
   end Rand_Gen;

   protected body Rand_Gen is
      procedure Init is
      begin
         Reset(G);
      end Init;

      function Get_Lap_Time return Duration is
         Lap_Float : Float;
      begin
         Lap_Float := 1.14 + (Random(G) * (1.30 - 1.14));
         return Duration(Lap_Float);
      end Get_Lap_Time;
   end Rand_Gen;

   -------------
   -- Printer --
   -------------
   protected Printer_Protected is
      procedure Print (Msg : String);
   end Printer_Protected;

   protected body Printer_Protected is
      procedure Print (Msg : String) is
      begin
         Put_Line(Msg);
      end Print;
   end Printer_Protected;

   -------------------
   -- Race_Position --
   -------------------
   protected Race_Pos is
      procedure Init(Arr : Driver_Array);
      procedure Increase_Race_Time_Of_Driver(D : Driver; Lap_Time : Duration);
      procedure Print_Array;
   private
      Drivers : Driver_Array;
   end Race_Pos;

   protected body Race_Pos is
      procedure Init(Arr : Driver_Array) is
      begin
         Drivers := Arr;
      end Init;

      procedure Increase_Race_Time_Of_Driver(D : Driver; Lap_Time : Duration) is
      begin
         for I in Drivers'Range loop
            if Get_Name(Drivers(I)) = Get_Name(D) then
               Increase_Total_Race_Time(Drivers(I), Lap_Time);
               exit;
            end if;
         end loop;
      end Increase_Race_Time_Of_Driver;

      procedure Sort_Drivers is
         Temp : Driver;
         Swapped : Boolean;
      begin
         loop
            Swapped := False;
            for I in Drivers'First .. Drivers'Last - 1 loop
               if Get_Total_Race_Time(Drivers(I)) > Get_Total_Race_Time(Drivers(I+1)) then
                  Temp := Drivers(I);
                  Drivers(I) := Drivers(I+1);
                  Drivers(I+1) := Temp;
                  Swapped := True;
               end if;
            end loop;
            exit when not Swapped;
         end loop;
      end Sort_Drivers;

      procedure Print_Array is
         S : Unbounded_String := To_Unbounded_String("");
      begin
         Sort_Drivers;
         for I in Drivers'Range loop
            S := S & To_Unbounded_String(To_String(Drivers(I))) & ASCII.LF;
         end loop;
         Printer_Protected.Print(To_String(S));
      end Print_Array;
   end Race_Pos;

   -------------
   -- Pit_Lane --
   -------------
   task Pit_Manager is
      entry Pit(D : Driver; Lap_Number : Positive);
   end Pit_Manager;

   task body Pit_Manager is
   begin
      loop
         select
            accept Pit(D : Driver; Lap_Number : Positive) do
               Printer_Protected.Print("***** " & Get_Name(D) & " has pitted on lap number: " & Integer'Image(Lap_Number) & " *****");
               delay 0.5;
               Race_Pos.Increase_Race_Time_Of_Driver(D, 0.5);
            end Pit;
         or
            terminate;
         end select;
      end loop;
   exception
      when others =>
         Printer_Protected.Print("Tasking error Pit_Manager");
   end Pit_Manager;

   ---------
   -- Car --
   ---------
   task type Car_Task is
      entry Init(Total_Laps : Positive; D : Driver);
   end Car_Task;

   task body Car_Task is
      My_Driver   : Driver;
      My_Laps     : Positive;
   begin
      accept Init(Total_Laps : Positive; D : Driver) do
         My_Laps := Total_Laps;
         My_Driver := D;
      end Init;

      for Lap in 1 .. My_Laps loop
         declare
            Lap_Time : Duration := Rand_Gen.Get_Lap_Time;
         begin
            delay Lap_Time;
            Race_Control.Lap_Completed(My_Driver, Lap, Lap_Time);

            if (Lap mod 20) = 0 and then Lap < My_Laps then
               Pit_Manager.Pit(My_Driver, Lap);
            end if;
         end;
      end loop;

   exception
      when others =>
         Printer_Protected.Print("Tasking error Car_Task");
   end Car_Task;

   --------------
   -- Control  --
   --------------
   task body Race_Control is
      Driver_Arr : Driver_Array;
      Laps       : Positive;
      Call_Count : Integer := 0;
   begin
      accept Init(Arr : Driver_Array; Total_Laps : Positive) do
         Driver_Arr := Arr;
         Laps := Total_Laps;
         Rand_Gen.Init;
         Race_Pos.Init(Driver_Arr);
      end Init;

      loop
         select
            accept Lap_Completed(D : Driver; Lap_Number : Positive; Lap_Time : Duration) do
               Race_Pos.Increase_Race_Time_Of_Driver(D, Lap_Time);
               Printer_Protected.Print(Get_Name(D) & " completed lap " & Integer'Image(Lap_Number) & ": " & Duration'Image(Lap_Time));
               Call_Count := Call_Count + 1;
               if (Call_Count mod 20) = 0 then
                  Race_Pos.Print_Array;
               end if;
            end Lap_Completed;
         or
            delay 5.0;
            Race_Pos.Print_Array;
            exit;
         end select;
      end loop;
   exception
      when others =>
         Printer_Protected.Print("Tasking error Race_Control");
   end Race_Control;

   -------------------
   -- Main Execution --
   -------------------
   Driver_Arr : Driver_Array;
   Cars       : array (1..20) of Car_Task;

begin

   Driver_Arr (1) := Init_Driver ("Max Verstappen", "Red Bull Racing");
   Driver_Arr (2) := Init_Driver ("Lando Norris", "McLaren");
   Driver_Arr (3) := Init_Driver ("Charles Leclerc", "Ferrari");
   Driver_Arr (4) := Init_Driver ("Oscar Piastri", "McLaren");
   Driver_Arr (5) := Init_Driver ("Carlos Sainz", "Ferrari");
   Driver_Arr (6) := Init_Driver ("George Russel", "Mercedes");
   Driver_Arr (7) := Init_Driver ("Lewis Hamilton", "Mercedes");
   Driver_Arr (8) := Init_Driver ("Sergio Perez", "Red Bull Racing");
   Driver_Arr (9) := Init_Driver ("Fernando Alonso", "Aston Martin");
   Driver_Arr (10) := Init_Driver ("Nico Hulkenberg", "Haas");
   Driver_Arr (11) := Init_Driver ("Yuki Tsunoda", "RB");
   Driver_Arr (12) := Init_Driver ("Pierre Gasly", "Alpine");
   Driver_Arr (13) := Init_Driver ("Lance Stroll", "Aston Martin");
   Driver_Arr (14) := Init_Driver ("Esteban Ocon", "Alpine");
   Driver_Arr (15) := Init_Driver ("Kevin Magnussen", "Haas");
   Driver_Arr (16) := Init_Driver ("Alexander Albon", "Williams");
   Driver_Arr (17) := Init_Driver ("Franco Collapinto", "Williams");
   Driver_Arr (18) := Init_Driver ("Liam Lawson", "RB");
   Driver_Arr (19) := Init_Driver ("Zhou Guanyu", "Kick Sauber");
   Driver_Arr (20) := Init_Driver ("Valtteri Bottas", "Kick Sauber");

   Race_Control.Init(Driver_Arr, 45);

   for I in Driver_Arr'Range loop
      Cars(I).Init(45, Driver_Arr(I));
   end loop;

end Main;
