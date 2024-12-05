with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

package Driver_Pkg is

   type Driver is private;

   function Init_Driver (Name, Team : String) return Driver;
   function Get_Name (D : Driver) return String;
   function Get_Team (D : Driver) return String;
   function Get_Total_Race_Time (D : Driver) return Duration;
   procedure Increase_Total_Race_Time (D : in out Driver; Add_Time : Duration);
   function To_String (D : Driver) return String;

private
   type Driver_Record is record
      Name           : Unbounded_String;
      Team           : Unbounded_String;
      Total_Race_Time: Duration := 0.0;
   end record;

   type Driver is new Driver_Record;

end Driver_Pkg;
