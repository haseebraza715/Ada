with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body Driver_Pkg is

   function Init_Driver (Name, Team : String) return Driver is
      D : Driver;
   begin
      D.Name := To_Unbounded_String(Name);
      D.Team := To_Unbounded_String(Team);
      D.Total_Race_Time := 0.0;
      return D;
   end Init_Driver;

   function Get_Name (D : Driver) return String is
   begin
      return To_String(D.Name);
   end Get_Name;

   function Get_Team (D : Driver) return String is
   begin
      return To_String(D.Team);
   end Get_Team;

   function Get_Total_Race_Time (D : Driver) return Duration is
   begin
      return D.Total_Race_Time;
   end Get_Total_Race_Time;

   procedure Increase_Total_Race_Time (D : in out Driver; Add_Time : Duration) is
   begin
      D.Total_Race_Time := D.Total_Race_Time + Add_Time;
   end Increase_Total_Race_Time;

   function To_String (D : Driver) return String is
      Time_String : constant String := Duration'Image(D.Total_Race_Time);
   begin
      return Get_Name(D) & " (" & Get_Team(D) & ") - total race time: " & Time_String;
   end To_String;

end Driver_Pkg;
