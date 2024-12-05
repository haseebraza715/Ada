package body QueueP is

   procedure Enqueue(Q: in out Queue; E: in Elem) is
      Ptr: Pointer := new Node'(E, null);
   begin
      if Is_Empty(Q) then
         Q.Head := Ptr;
         Q.Tail := Ptr;
         Q.Size := Q.Size + 1;
      else
         Q.Tail.Next := Ptr;
         Q.Tail := Q.Tail.Next;
         Q.Size := Q.Size + 1;
      end if;
   end Enqueue;
   
      
   procedure Dequeue(Q: in out Queue; E: out Elem) is
   begin
      E := Top(Q);
      Q.Head := Q.Head.Next;
      Q.Size := Q.Size;
   exception
         when Constraint_Error => raise Empty_Queue;
   end Dequeue;
   
   
   function Top(Q: Queue) return Elem is
   begin
      return Q.Head.Data;
   exception
      when Constraint_Error => raise Empty_Queue;
   end Top;
   
      
   function Is_Empty(Q: Queue) return Boolean is
   begin
      return Q.Size = 0;
   end Is_Empty;
   
      
   function Is_Full(Q: Queue) return Boolean is
   begin
      return False;
   end Is_Full;
   
      
   function Size(Q: Queue) return Natural is
   begin
      return Q.Size;
   end Size;

end QueueP;
