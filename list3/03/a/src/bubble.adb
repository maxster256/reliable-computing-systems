package body Bubble with SPARK_Mode is
   procedure Sort (A : in out Arr)
   is
      Temp : Integer;
   begin
      -- Bubble sort
       Outer : for I in reverse A'First .. A'Last - 1 loop
         Inner : for J in A'First .. I loop
            if A (J) > A(J + 1) then
               Temp  := A (J);
               A (J) := A (J + 1);
               A (J + 1) := Temp;
            end if;

            -- For a number during phase step of sorting
            -- There should be still some numbers equal at the input
            -- before inner loop entry
            pragma Loop_Invariant (for all K1 in J .. J + 1 => (for some K2 in A'Range => A(K1) = A'Loop_Entry(Inner)(K2)));
            -- The array up until the J+1 should already be bubbled
            pragma Loop_Invariant (Bubbled (A (A'First .. J + 1)));
            -- There should be still some numbers left as in input
            -- before the inner loop entry
            pragma Loop_Invariant (for all K1 in A'First .. I + 1 => (for some K2 in A'First .. I + 1 => A(K1) = A'Loop_Entry(Inner)(K2)));
            --pragma Loop_Invariant (for all K1 in A'Range => (for some K2 in A'Range => A(K1) = A'Loop_Entry(Inner)(K2)));
            --pragma Loop_Invariant (for all K1 in A'Range => (for some K2 in A'Range => A(K2) = A'Loop_Entry(Inner)(K1)));

            -- The elements in array after I + 2 to the end of array
            -- should be unsorted at this point by the bubble sort
            pragma Loop_Invariant (for all K in I + 2 .. A'Last => A(K) = A'Loop_Entry(Inner)(K));
         end loop Inner;

         -- The elements
         pragma Loop_Invariant (Sorted (A (I .. A'Last)));
         pragma Loop_Invariant (Bubbled (A (A'First .. I + 1)));
         --pragma Loop_Invariant (for all K1 in A'Range => (for some K2 in A'Range => A(K1) = A'Loop_Entry(Outer)(K2)));
         --pragma Loop_Invariant (for all K1 in A'Range => (for some K2 in A'Range => A(K2) = A'Loop_Entry(Outer)(K1)));
      end loop Outer;
   end Sort;
end Bubble;
