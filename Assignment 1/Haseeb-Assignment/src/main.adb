with Ada.Text_IO;
with Teams;
with Championship;
with Ada.Strings.Unbounded;
use Ada.Text_IO;
use Ada.Strings.Unbounded;
use Teams;

procedure Main is

    subtype Index_Range is Integer range 1 .. 10;


    type Team_Array_Type is array (Index_Range range <>) of Team;

    Teams_List : Team_Array_Type(1 .. 3);

    package My_Championship is new Championship
        (Index_Type => Index_Range,
         Team_Type => Team,
         Team_Array_Type => Team_Array_Type,
         Max_Teams => 10);

    procedure Award_Points (Driver_Names : My_Championship.Top_3_Drivers_Type) is
    begin
        for i in Driver_Names'Range loop
            for j in Teams_List'Range loop
                if Get_Driver_1_Name(Teams_List(j)) = Driver_Names(i) or
                   Get_Driver_2_Name(Teams_List(j)) = Driver_Names(i) then
                    case i is
                        when 1 => Add_Points(Teams_List(j), 25);
                        when 2 => Add_Points(Teams_List(j), 18);
                        when 3 => Add_Points(Teams_List(j), 15);
                        when others => null;
                    end case;
                end if;
            end loop;
        end loop;
    end Award_Points;

    procedure Update_Team_Cost (T : in out Team) is
    begin
        Add_Season_Cost(T, 10_000_000.0 * Float(Get_Engine_Value(Get_Engine_Type(T))));
    end Update_Team_Cost;

    procedure My_Record_Race is new My_Championship.Record_Race(Award_Points);
    procedure My_Update_Costs is new My_Championship.Update_Season_Costs(Update_Team_Cost);

begin
    Put_Line("Program starting...");

    My_Championship.Create_Championship(To_Unbounded_String("Formula 1 2024"));

    Create_Team(Teams_List(1), Red_Bull_Racing, Honda_RBPT, To_Unbounded_String("Max Verstappen"), To_Unbounded_String("Sergio Perez"), 50_000_000.0);
    Create_Team(Teams_List(2), Ferrari, Ferrari, To_Unbounded_String("Charles Leclerc"), To_Unbounded_String("Carlos Sainz"), 45_000_000.0);
    Create_Team(Teams_List(3), Mercedes, Mercedes, To_Unbounded_String("Lewis Hamilton"), To_Unbounded_String("George Russell"), 55_000_000.0);

    My_Championship.Add_Teams(Teams_List);

    Put_Line("Initial Championship State:");
    My_Championship.Print_Championship_JSON;

    declare
        Race_1_Results : My_Championship.Top_3_Drivers_Type :=
            (To_Unbounded_String("Max Verstappen"),
             To_Unbounded_String("Charles Leclerc"),
             To_Unbounded_String("Lewis Hamilton"));
    begin
        Put_Line("Running Race 1...");
        My_Record_Race(Race_1_Results);
        My_Update_Costs;
        Put_Line("Race 1 completed successfully");
    end;

    Put_Line("Championship State After Race 1:");
    My_Championship.Print_Championship_JSON;

    Put_Line("Team Details After Race 1:");
    for I in Teams_List'Range loop
        Print_Team_JSON(Teams_List(I));
    end loop;

    Put_Line("Program completed successfully");
end Main;
