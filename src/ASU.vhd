LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY ASU IS

PORT(Cin: IN STD_LOGIC;
X, Y: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
S: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
Cout, neg, Overflow: OUT STD_LOGIC);

END ASU;

ARCHITECTURE Behavior OF ASU IS 
    SIGNAL Sum: STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN
	PROCESS (X, Y, Cin)
	BEGIN
		IF(Cin = '0') THEN
			Sum <= ('0' & X) + ('0' & Y) + Cin;
		ELSIF (Cin = '1') THEN
			Sum <= ('0' & X) + ('0' & NOT Y) + Cin;
		END IF;
		S <= Sum(3 DOWNTO 0);
		Cout <= Sum(4);
		neg <= Sum(3);
		Overflow<= Sum(4) XOR X(3) XOR Y(3) XOR Sum(3);
		
	END PROCESS; 
END Behavior;