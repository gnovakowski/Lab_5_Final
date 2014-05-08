----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:06:36 01/29/2014 
-- Design Name: 
-- Module Name:    pixel_gen - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity pixel_gen is
    Port ( row : in  unsigned(10 downto 0);
           column : in  unsigned(10 downto 0);
           blank : in  STD_LOGIC;
           ball_x : in  STD_LOGIC_VECTOR (10 downto 0);
           ball_y : in  STD_LOGIC_VECTOR (10 downto 0);
           paddle_y : in  STD_LOGIC_VECTOR (10 downto 0);
           r : out  STD_LOGIC_VECTOR (7 downto 0);
           g : out  STD_LOGIC_VECTOR (7 downto 0);
           b : out  STD_LOGIC_VECTOR (7 downto 0));
end pixel_gen;

architecture Behavioral of pixel_gen is
	signal blue_logo : std_logic_vector(7 downto 0);
	signal column_new, row_new : unsigned(10 downto 0);
	signal paddle_y_new, ball_x_new, ball_y_new : unsigned(10 downto 0);
	signal corr : unsigned(10 downto 0);

begin
	column_new <= unsigned(column);
	row_new <= unsigned(row);
	paddle_y_new <= unsigned(paddle_y);
	ball_x_new <= unsigned(ball_x);
	ball_y_new <= unsigned(ball_y);


	corr <=  ("00000101000" - paddle_y_new) when (paddle_y_new > ("11111111111" - 30)) else
						(others => '0');

		blue_logo <=
			  "00000000" when (blank = '1') else
			  "10101010" when (column_new > 200 and column_new < 280 and row_new > 200 and row_new < 220) else
			  "10101010" when (column_new > 200 and column_new < 220 and row_new > 200 and row_new < 280) else
			  "10101010" when (column_new > 260 and column_new < 280 and row_new > 200 and row_new < 280) else
			  "10101010" when (column_new > 220 and column_new < 260 and row_new > 240 and row_new < 260) else
			  "10101010" when (column_new > 320 and column_new < 400 and row_new > 200 and row_new < 220) else
			  "10101010" when (column_new > 320 and column_new < 340 and row_new > 200 and row_new < 280) else
			  "10101010" when (column_new > 320 and column_new < 400 and row_new > 240 and row_new < 260) else
			  "00000000";

		g <= "00000000" when (blank = '1') else
			  "11111111" when (column_new > 9 and column_new < 21 and (row_new > (paddle_y_new - 30) or 
									 row_new < corr) and row_new < (paddle_y_new + 30) ) else
			  "00000000"; 
 
		r <= "00000000" when (blank = '1') else
			  "00000000" when (blue_logo /= "00000000") else
			  "11111111" when (column_new > (ball_x_new - 5) and column_new < (ball_x_new + 5) and 
									 row_new > (ball_y_new - 5) and row_new < (ball_y_new + 5) ) else
			  "00000000";

		b <= blue_logo;

end Behavioral;
