generic
   type T is private;
package Element is 
   procedure Set(E:T);
   procedure Reset;
   function IsValid  return Boolean;
private 
   Value : T;
   Valid : Boolean;
end Element;
