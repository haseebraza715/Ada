with QueueP, Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure QueueDemo is
   
   package My_Queue is new QueueP(Integer);
   use My_Queue;
   
   Q: Queue;
   X: Integer;
   
begin
   
   Put_Line("Enqueue 1..8");
   for I in 1..8 loop
      Put(I);
      Enqueue(Q, I);
   end loop;
   New_Line;
   
   Put_Line("Top: " & Integer'Image(Top(Q)));
   Dequeue(Q, X);
   Put_Line("Dequeue: " & Integer'Image(X));
   Dequeue(Q, X);
   Put_Line("Dequeue: " & Integer'Image(X));
   
   Put_Line("Dequeue the rest: ");
   while not Is_Empty(Q) loop
      Dequeue(Q, X);
      Put(X);
   end loop;
   
   
   
end QueueDemo;
