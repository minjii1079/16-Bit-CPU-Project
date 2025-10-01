LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity machine IS
	port(data_in, clk,reset:in	std_logic;
				  	 student_id:out std_logic_vector(3 downto 0);
			    current_state:out std_logic_vector(3 downto 0));
end machine;

architecture fsm of machine is
	type state_type is(s0, s1, s2, s3, s4, s5, s6, s7);
	signal yfsm: state_type;
begin
	process (clk, reset)
	begin
		if reset = '1' then
			yfsm <= s0;
		elsif (clk'EVENT AND clk = '1') then
			case yfsm is
				when s0 =>
					if data_in = '1' then
					yfsm <= s1;
					end if;
				when s1 =>
					if data_in = '1' then
					yfsm <= s2;
					end if;
				when s2 =>
					if data_in = '1' then
					yfsm <= s3;
					end if;
				when s3 =>
					if data_in = '1' then
					yfsm <= s4;
					end if;
				when s4 =>
					if data_in = '1' then
					yfsm <= s5;
					end if;
				when s5 =>
					if data_in = '1' then
					yfsm <= s6;
					end if;
				when s6 =>
					if data_in = '1' then
					yfsm <= s7;
					end if;
				when s7 =>
					if data_in = '1' then
					yfsm <= s0;
					end if;
			end case;
		end if;
	end process;
	process (yfsm)
	begin
		case (yfsm) is
			when s0 => current_state <= "0000";
				student_id <= "0000"; --d1 0
			when s1 => current_state <= "0001";
				student_id <= "0001"; --d2 1
			when s2 => current_state <= "0010";
				student_id <= "0010"; --d3 2
			when s3 => current_state <= "0011";
				student_id <= "0100"; --d4 4
			when s4 => current_state <= "0100";
				student_id <= "0010"; --d5 2
			when s5 => current_state <= "0101";
				student_id <= "0110"; --d6 6
			when s6 => current_state <= "0110";
				student_id <= "0000"; --d7 0
			when s7 => current_state <= "0111";
				student_id <= "1000"; --d8 8
		end case; 
	end process;
end fsm;
				
					