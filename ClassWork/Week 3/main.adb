with Ada.Text_IO;
use Ada.Text_IO;

procedure Main is

   subtype Natural is Integer range 0..Integer'Last;
   subtype Positive is Integer range 1..Integer'Last;



   type T_Arr is array(Natural range <>) of Integer;
   X: T_Arr := (3,5,6,7,8);

   X1: T_Arr(1..5) := (others => 0);


   type Index is new Integer;
   type Elem is new Float;
   type Arr is array(Index range <>) of Elem;


   type Month_Duration is range 1..31;
   type Month is (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);
   type My_Year_Arr is array(Month) of Month_Duration;

   Cal: constant My_Year_Arr := (31,28,31,30,31,30,31,31,30,31,30,31);


begin

   Put_Line(Month_Duration'Image(Cal(Mar)));

end Main;
