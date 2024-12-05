with Ada.Strings.Unbounded;

package Teams is
    type Team_Name_T is (McLaren, Red_Bull_Racing, Ferrari, Mercedes, Aston_Martin,
                         RB, Haas, Williams, Alpine, Kick_Sauber);

    type Engine_T is (Renault, Ferrari, Mercedes, Honda_RBPT);
    for Engine_T use (1, 2, 3, 4);

    type Team is private;

    function Get_Team_Name (T : Team) return Team_Name_T;
    function Get_Engine_Type (T : Team) return Engine_T;
    function Get_Driver_1_Name (T : Team) return Ada.Strings.Unbounded.Unbounded_String;
    function Get_Driver_2_Name (T : Team) return Ada.Strings.Unbounded.Unbounded_String;
    function Get_Points (T : Team) return Natural;
    function Get_Season_Cost (T : Team) return Float;

    function Get_Engine_Value (E : Engine_T) return Natural;

    procedure Print_Team_JSON (T : Team);

    procedure Add_Points (T : in out Team; Points : Natural);
    procedure Add_Season_Cost (T : in out Team; Cost : Float);

    procedure Create_Team (
        T : out Team;
        Name : Team_Name_T;
        Engine : Engine_T;
        Driver1 : Ada.Strings.Unbounded.Unbounded_String;
        Driver2 : Ada.Strings.Unbounded.Unbounded_String;
        Cost : Float := 0.0);

private
    type Team is record
        Team_Name   : Team_Name_T := McLaren;
        Engine      : Engine_T := Renault;
        Driver_1    : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
        Driver_2    : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
        Points      : Natural := 0;
        Season_Cost : Float := 0.0;
    end record;
end Teams;
