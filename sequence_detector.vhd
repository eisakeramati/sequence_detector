----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:04:48 02/24/2018 
-- Design Name: 
-- Module Name:    SD - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity meal_shit is
	port(
		input, clk1, rst1: in std_logic;
		output, o0, o1, o2, o3, o4: out std_logic
	);
end meal_shit;

architecture Behavioral of meal_shit is

type state_t is (s0, s1, s2, s3);
signal state: state_t := s0;
signal next_state: state_t := s0;
signal res: std_logic:= '0';

begin

	GHOLI: process(state, input, rst1)
	begin
		case state is
			when s0 =>
				if(input='0') then
					next_state <= s0;
					res <= '0';
				else
					next_state <= s1;
					res <= '0';
				end if;
			when s1 =>
				if(input='0') then
					next_state <= s0;
					res <= '0';
				else
					next_state <= s2;
					res <= '0';
				end if;
			when s2 =>
				if(input='0') then
					next_state <= s3;
					res <= '0';
				else
					next_state <= s2;
					res <= '0';
				end if;
			when s3 =>
				if(input='0') then
					next_state <= s0;
					res <= '0';
				else
					next_state <= s1;
					res <= '1';
				end if;
		end case;
		
		if rst1='0' then
			next_state <= s0;
			res <= '0';
		end if;
	end process;

	ASGHAR: process(clk1)
	begin
		if(clk1'event and clk1 = '1') then
			state <= next_state;
		end if;
	end process;
	
	output <= res;
	o0 <= '1' when state = s0 else '0';
	o1 <= '1' when state = s1 else '0';
	o2 <= '1' when state = s2 else '0';
	o3 <= '1' when state = s3 else '0';
	o4 <= '1';
	
end Behavioral;

