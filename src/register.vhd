LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY register IS
    PORT(
        A : in std_logic_vector(7 downto 0); -- 8-bit input
        res, clk : in std_logic;
        Q : out std_logic_vector(7 downto 0) -- 8-bit output
    );
END register;

ARCHITECTURE behavior OF register IS
BEGIN
    PROCESS (res, clk)
    BEGIN
        IF res = '1' THEN
            Q <= "00000000";
        ELSIF rising_edge(clk) THEN
            Q <= A;
        END IF;
    END PROCESS;
END behavior;
