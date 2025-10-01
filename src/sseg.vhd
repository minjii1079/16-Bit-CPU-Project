LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY sseg IS
PORT ( bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
		leds1, leds2 : OUT STD_LOGIC_VECTOR(0 TO 6) ;
		neg : IN STD_LOGIC);
END sseg ;

ARCHITECTURE Behavior OF sseg IS
BEGIN
	PROCESS (bcd, neg)
	BEGIN
	CASE bcd IS --abcdefg
	WHEN "0000" =>leds1 <= NOT ("1111110") ;
	WHEN "0001" =>leds1 <= NOT ("0110000") ;
	WHEN "0010" =>leds1 <= NOT ("1101101") ;
	WHEN "0011" =>leds1 <= NOT ("1111001") ;
	WHEN "0100" =>leds1 <= NOT ("0110011") ; --4
	WHEN "0101" =>leds1 <= NOT ("1011011") ;
	WHEN "0110" =>leds1 <= NOT ("1011111") ;
	WHEN "0111" =>leds1 <= NOT ("1110000") ; --7
	WHEN "1000" =>leds1 <= NOT ("1111111") ;
	WHEN "1001" =>leds1 <= NOT ("1110011") ;
	WHEN "1010" =>leds1 <=  ("0001000") ;
	WHEN "1011" =>leds1 <=  ("1100000") ;
	WHEN "1100" =>leds1 <=  ("0110001") ;
	WHEN "1101" =>leds1 <=  ("1000010") ;
	WHEN "1110" =>leds1 <=  ("0110000") ;
	WHEN "1111" =>leds1 <=  ("0111000") ;
	WHEN OTHERS =>leds1 <=  ("-------") ;	
	END CASE ;
	IF(neg = '1') THEN
		leds2 <= ("1111110");
	ELSE
		leds2 <= ("1111111");
	END IF;
	
	END PROCESS ;
END Behavior ;