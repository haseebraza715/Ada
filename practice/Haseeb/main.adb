with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Command_Line;
with Bag;
use Ada.Text_IO;
use Ada.Integer_Text_IO;
use Ada.Command_Line;
use Bag;

procedure Main is


    B : Bag_Type(50);
    N : Integer;

begin
    for I in 1..Argument_Count loop
        N := Integer'Value(Argument(I));
        Insert_One(B, N);
    end loop;

    for I in 1..Argument_Count loop
        if not Is_Empty(B) then
            Extract_One(B, N);
            Put(N);
        end if;
    end loop;
end Main;
