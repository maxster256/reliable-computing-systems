with Ada.Text_IO; use Ada.Text_IO;
with Rev;

procedure Main is
   Unreversed_String : String := "Ada is the Best!";
begin
   Rev (Unreversed_String);
   Put_Line (Unreversed_String);
end Main;
