package lines is
   
   subtype Elem is Integer;
   
   type Queue(Max:Positive) is limited private;
   -- limited private means it can not be assigned or initialized
   -- this one is for inserting
   
   procedure Hiext(Q: in out Queue; E : in Elem);
   -- this one is for poppping the elemenr from the queue
   
   procedure Lopop(Q: in out Queue; E : out Elem);
   
   function Lov(S:Queue) return Elem;
   function Is_Empty(S: Queue) return Boolean;
   function Is_Full(S: Queue) return Boolean;
   
   function Size (S:Queue) return Natural;
private
   type Tarray is array (Integer range <>) of Elem;
   type Queue(Max: Natural) is record
      Adatok: Tarray(1..Max);
      Putter , Getter : Positive := 1;
      Size : Natural := 0;
      
   end record;
   
   
end lines;




