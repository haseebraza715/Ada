with Ada.Text_IO, QueueP;
use Ada.Text_IO;

procedure QueueDemo is
   
   type Elem is new Integer;
   type Index is new Positive;
   type Arr is array(Index range <>) of Elem;
   
   function My_Compare(S: Natural; I: Index) return Boolean is
   begin
      if Index(S) = I then 
         return True;
      else
         return False;
      end if;
   end My_Compare;
   
   package My_Queue is new QueueP(Index, Elem, Arr, My_Compare);
   use My_Queue;
   
   procedure Print_Element(E: in Elem) is
   begin
      Put_Line(Elem'Image(E));
   end Print_Element;
   
   procedure Print_Queue is new My_Queue.For_Each(Print_Element);
   
   Max: Index := Index'First + 4;
   Q: Queue(Max);
   
   
begin
   
   Enqueue(Q, 1);
   Enqueue(Q, 2);
   Enqueue(Q, 3);
   Enqueue(Q, 4);
   Enqueue(Q, 5);
   Print_Queue(Q);
   
end QueueDemo;
