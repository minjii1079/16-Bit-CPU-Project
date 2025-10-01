LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

entity ALU_unit3 is -- ALU unit includes Reg. 3
port ( clk : in std_logic ;
opcode : in std_logic_vector(15 downto 0); -- 8-bit opcode from Decoder
  student_id : in std_logic_vector (3 downto 0);
  Reg1, Reg2 : in std_logic_vector(7 downto 0); -- 8-bit Result
         Result : out std_logic_vector(7 downto 0);
option : out std_logic);
end ALU_unit3 ;

architecture calculation of ALU_unit3 is
--Reg1, Reg2, 

begin
--Reg1 <= A;
--Reg2 <= B;
process (Reg1, student_id)
begin
if (Reg1(7 downto 4) = student_id or Reg1(3 downto 0) = student_id) then
option <= '1';
else
option <= '0';
end if;
end process;
 
process (clk)
begin
if (clk'EVENT AND clk = '1') then
case opcode is
when "0000000000000001" => 
Result <= Reg1 + Reg2;
-- Do addition for Reg1 and Reg2
when "0000000000000010" => 
if (Reg1 > Reg2) then
Result <= Reg1 - Reg2;
else
Result <= Reg1 - Reg2;
end if;
-- Do subtraction for Reg1 and Reg2
when "0000000000000100" =>
Result <= NOT Reg1;
-- Do inverse
when "0000000000001000" => 
Result <= Reg1 NAND Reg2;
-- Do Boolean NAND
when "0000000000010000" => 
Result <= Reg1 NOR Reg2;
-- Do Boolean NOR
when "0000000000100000" => 
Result <= Reg1 AND Reg2;
-- Do Boolean AND
when "0000000001000000" => 
Result <= Reg1 XOR Reg2;
-- Do Boolean XOR
when "0000000010000000" => 
Result <= Reg1 OR Reg2;
-- Do Boolean OR
when others =>
-- Dont care, do nothing
end case;
end if;
end process;
end calculation;