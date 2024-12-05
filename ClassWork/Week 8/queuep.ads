generic
   type Elem is private;
package QueueP is

   type Queue is limited private;
   
   Empty_Queue: exception;
   
   procedure Enqueue(Q: in out Queue; E: in Elem);
   procedure Dequeue(Q: in out Queue; E: out Elem);
   
   function Top(Q: Queue) return Elem;
   function Is_Empty(Q: Queue) return Boolean;
   function Is_Full(Q: Queue) return Boolean;
   function Size(Q: Queue) return Natural;
   
private
   
   type Node;
   type Pointer is access Node;
   
   type Node is record
      Data: Elem;
      Next: Pointer := null;
   end record;
   
   type Queue is record
      Size: Natural := 0;
      Head: Pointer:= null;
      Tail: Pointer := null;
   end record;

end QueueP;
