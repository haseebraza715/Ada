package Tools is

   protected Output is
      procedure Puts(Str: String; Num: Natural := 0);
   end Output;
   
   generic
      type T is (<>);
   package Random_Generator is
      function GetRandom return T;
   end Random_Generator;
   
end Tools;
