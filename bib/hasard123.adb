with Random_Generic;

function hasard123 return Integer is

subtype Integer123 is Positive range 1..3;

package Random_Generic_123 is new Random_Generic(Integer123);

begin
return Random_Generic_123.Random_Value;
end hasard123;
