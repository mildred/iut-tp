with Random_Generic;

function hasardtrentedeux return Integer is

subtype Integer32 is Positive range 1..32;

package Random_Generic_32 is new Random_Generic(Integer32);

begin
return Random_Generic_32.Random_Value;
end hasardtrentedeux;
