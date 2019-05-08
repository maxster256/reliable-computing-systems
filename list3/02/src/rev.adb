procedure Rev (S : in out String) with
  SPARK_Mode,
  Pre => S'First < Positive'Last / 2 and S'Last < Positive'Last / 2,
  Post => (for all I in S'Range => S(I) = S'Old(S'First + S'Last - I))
is
   Unreversed_String : String (S'Range) := S;
begin
   for I in S'Range loop
      -- Reverse the string letter-by-letter
      S (I) := Unreversed_String (S'Last - I + S'First);

      -- At this point all the letters before index J should be reversed and
      -- the letter at index J should be equal to input (unreversed)
      pragma Loop_Invariant (for all J in S'First .. I => S(J) = Unreversed_String (S'Last - J + S'First));
   end loop;
end Rev;
