function Mult (A : Natural; B : Natural) return Natural with
  SPARK_Mode,
  Pre => A < 32768 and B < 32768,
  Post => Mult'Result = A * B
is
   AB : Natural := 0;
   AA : Natural := A;
   B1 : Natural := B;
begin
   -- Performs the multiplication
   -- using the Russian Peasant Method
   while B1 > 0 loop
      if B1 mod 2 = 1 then
         AB := AB + AA;
      end if;

      -- Multiply the AA
      AA := 2 * AA;
      -- Half the B1
      B1 := B1 / 2;

      -- The result of multiplication A * B should be equal to
      -- AA * B1 + AB according tho the algorithm
      pragma Loop_Invariant (A * B = AA * B1 + AB);
   end loop;

   return AB;
end Mult;
