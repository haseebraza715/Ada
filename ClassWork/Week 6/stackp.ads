with Ada.Text_IO;
use Ada.Text_IO;

generic
   type Index is (<>);
   type Elem is private;
   type Arr is array(Index range <>) of Elem;
   with function "="(S: Natural; I: Index) return Boolean is <>;
package StackP is
   
   type Stack(Max: Index) is limited private;
   
   procedure Push(S: in out Stack; E: in Elem);
   procedure Pop(S: in out Stack; E: out Elem);
   function Top(S: Stack) return Elem;
   function Is_Empty(S: Stack) return Boolean;
   function Is_Full(S: Stack) return Boolean;
   function Size(S: Stack) return Natural;
   
   generic
      with procedure Process_Element(E: in out Elem);
   procedure For_Each(S: in out Stack);

private
   
   type Stack(Max: Index) is record
      Data: Arr(Index'First..Max);
      Pointer: Index := Index'First;
      Size: Natural := 0;
   end record;
   

end StackP;
