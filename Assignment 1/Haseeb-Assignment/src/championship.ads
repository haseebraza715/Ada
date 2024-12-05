with Ada.Strings.Unbounded;

generic
    type Index_Type is (<>);
    type Team_Type is private;
    type Team_Array_Type is array (Index_Type range <>) of Team_Type;
    Max_Teams : Index_Type;
package Championship is
    subtype Name_Type is Ada.Strings.Unbounded.Unbounded_String;
    type Top_3_Drivers_Type is array(1 .. 3) of Name_Type;

    procedure Create_Championship (Champ_Name : in Name_Type);
    procedure Add_Teams (New_Teams : Team_Array_Type);
    procedure Print_Championship_JSON;

    generic
        with procedure Award_Points (Driver_Names : Top_3_Drivers_Type);
    procedure Record_Race (Top_3_Drivers : Top_3_Drivers_Type);

    generic
        with procedure Update_Team_Cost (T : in out Team_Type);
    procedure Update_Season_Costs;

private
    type Championship_Record is record
        Champ_Name               : Name_Type;
        Teams_List               : Team_Array_Type(Index_Type'First .. Max_Teams);
        Current_Non_Racing_Team  : Team_Type;
        Current_Non_Racing_Team_Set : Boolean := False;
        Num_Teams                : Index_Type := Index_Type'First;
        Points_First             : Natural := 25;
        Points_Second            : Natural := 18;
        Points_Third             : Natural := 15;
    end record;

    Champ : Championship_Record;
end Championship;
