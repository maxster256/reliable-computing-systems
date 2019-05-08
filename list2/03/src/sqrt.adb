function Sqrt (X : Float; Tolerance : Float) return Float
   is
      result :Float := X;
   begin

      while abs (X - result ** 2) > X * Tolerance loop
         result := (result + X/result) / 2.0;

         pragma Loop_Invariant((if X < 1.0 then (result >= X and result < 1.0)));
         pragma Loop_Invariant((if X > 1.0 then (result >= 1.0 and result < X)));
      end loop;

      return result;

   end;
