with Ada.Text_IO;
with Ada.Strings.Unbounded;
use Ada.Text_IO;
use Ada.Strings.Unbounded;

package body Teams is

    function Get_Team_Name (T : Team) return Team_Name_T is
    begin
        return T.Team_Name;
    end Get_Team_Name;

    function Get_Engine_Type (T : Team) return Engine_T is
    begin
        return T.Engine;
    end Get_Engine_Type;

    function Get_Driver_1_Name (T : Team) return Unbounded_String is
    begin
        return T.Driver_1;
    end Get_Driver_1_Name;

    function Get_Driver_2_Name (T : Team) return Unbounded_String is
    begin
        return T.Driver_2;
    end Get_Driver_2_Name;

    function Get_Points (T : Team) return Natural is
    begin
        return T.Points;
    end Get_Points;

    function Get_Season_Cost (T : Team) return Float is
    begin
        return T.Season_Cost;
    end Get_Season_Cost;

    function Get_Engine_Value (E : Engine_T) return Natural is
    begin
        return Natural(Engine_T'Pos(E) + 1);
    end Get_Engine_Value;

    procedure Print_Team_JSON (T : Team) is
    begin
        Put_Line("{");
        Put_Line("   ""Team Name"": """ & Team_Name_T'Image(T.Team_Name) & """,");
        Put_Line("   ""Engine Type"": """ & Engine_T'Image(T.Engine) & """,");
        Put_Line("   ""Driver 1"": """ & To_String(T.Driver_1) & """,");
        Put_Line("   ""Driver 2"": """ & To_String(T.Driver_2) & """,");
        Put_Line("   ""Points"": " & Natural'Image(T.Points) & ",");
        Put_Line("   ""Season Cost"": " & Float'Image(T.Season_Cost));
        Put_Line("}");
    end Print_Team_JSON;

    procedure Add_Points (T : in out Team; Points : Natural) is
    begin
        T.Points := T.Points + Points;
    end Add_Points;

    procedure Add_Season_Cost (T : in out Team; Cost : Float) is
    begin
        T.Season_Cost := T.Season_Cost + Cost;
    end Add_Season_Cost;

    procedure Create_Team (
        T : out Team;
        Name : Team_Name_T;
        Engine : Engine_T;
        Driver1 : Unbounded_String;
        Driver2 : Unbounded_String;
        Cost : Float := 0.0) is
    begin
        T.Team_Name := Name;
        T.Engine := Engine;
        T.Driver_1 := Driver1;
        T.Driver_2 := Driver2;
        T.Season_Cost := Cost;
        T.Points := 0;
    end Create_Team;

end Teams;
