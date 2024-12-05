package Stacks is
   
   type Stack is private;
   
   --  lets define some procedure of it 
   procedure Push(S : in out Stack; Val:Integer);
   procedure Pop(S: in out Stack: Val : out Integer);
   
private 
   subtype Stack_Index is range Natural 1..10;
   type Content_Type is array (Stack_Index) of Natural;
   
   type Stack is record
      Top:Stack_Index;
      Content : Content_Type;
   end record;
   
  
end Stacks;
