with Ada.Text_IO;
with Ada.Strings.Unbounded;
use Ada.Text_IO;
use Ada.Strings.Unbounded;

package body Championship is

    procedure Create_Championship (Champ_Name : in Name_Type) is
    begin
        Champ.Champ_Name := Champ_Name;
        Champ.Num_Teams := Index_Type'First;
        Champ.Current_Non_Racing_Team_Set := False;
    end Create_Championship;

    procedure Add_Teams (New_Teams : Team_Array_Type) is
    begin
        for I in New_Teams'Range loop
            if Champ.Num_Teams < Max_Teams then
                Champ.Num_Teams := Index_Type'Succ(Champ.Num_Teams);
                Champ.Teams_List(Champ.Num_Teams) := New_Teams(I);
            else
                Put_Line("Cannot add more teams. Maximum reached.");
                exit;
            end if;
        end loop;
    end Add_Teams;

    procedure Record_Race (Top_3_Drivers : Top_3_Drivers_Type) is
        Winner_Team : Team_Type;
    begin
        Award_Points(Top_3_Drivers);

        if Champ.Num_Teams > Index_Type'First then
            Winner_Team := Champ.Teams_List(Champ.Num_Teams);

            if Champ.Current_Non_Racing_Team_Set then
                Champ.Teams_List(Champ.Num_Teams) := Champ.Current_Non_Racing_Team;
            else
                Champ.Num_Teams := Index_Type'Pred(Champ.Num_Teams);
            end if;

            Champ.Current_Non_Racing_Team := Winner_Team;
            Champ.Current_Non_Racing_Team_Set := True;
        end if;
    end Record_Race;

    procedure Update_Season_Costs is
    begin
        for I in Index_Type'First .. Champ.Num_Teams loop
            Update_Team_Cost(Champ.Teams_List(I));
        end loop;

        if Champ.Current_Non_Racing_Team_Set then
            Update_Team_Cost(Champ.Current_Non_Racing_Team);
        end if;
    end Update_Season_Costs;

    procedure Print_Championship_JSON is
    begin
        Put_Line("{");
        Put_Line("   ""Championship Name"": """ & To_String(Champ.Champ_Name) & """,");
        Put_Line("   ""Number of Teams"": " & Index_Type'Image(Champ.Num_Teams) & ",");
        Put_Line("   ""Points System"": {");
        Put_Line("      ""First Place"": " & Natural'Image(Champ.Points_First) & ",");
        Put_Line("      ""Second Place"": " & Natural'Image(Champ.Points_Second) & ",");
        Put_Line("      ""Third Place"": " & Natural'Image(Champ.Points_Third));
        Put_Line("   }");
        Put_Line("}");
    end Print_Championship_JSON;

end Championship;
