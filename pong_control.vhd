----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:54:19 02/10/2014 
-- Design Name: 
-- Module Name:    pong_control - Behavioral 
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
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity pong_control is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           up : in  STD_LOGIC;
           down : in  STD_LOGIC;
			  speed : in STD_LOGIC;
           v_completed : in  STD_LOGIC;
           ball_x : out  STD_LOGIC_VECTOR (10 downto 0);
           ball_y : out  STD_LOGIC_VECTOR (10 downto 0);
           paddle_y : out  STD_LOGIC_VECTOR (10 downto 0);
			  test : out STD_LOGIC_VECTOR(9 downto 0));
end pong_control;

architecture Behavioral of pong_control is
	signal delay_reg : unsigned(9 downto 0) := (others => '0');
	signal delay_reg_next : unsigned(9 downto 0); 
	signal paddle_y_reg : unsigned(10 downto 0) := "00100000000";
	signal paddle_y_n : unsigned(10 downto 0);
	signal ball_x_reg, ball_y_reg : unsigned(10 downto 0) := "00100000000"; 
	signal ball_x_n, ball_y_n : unsigned(10 downto 0);
	signal ball_x_speed, ball_y_speed : unsigned(10 downto 0) := "00000000001";
	signal ball_x_dir, ball_y_dir : std_logic := '1';
	signal running : std_logic := '1';
	signal hit_paddle : std_logic := '0';
	signal delay : unsigned(9 downto 0) := (others => '1');

begin
ball_x_n <= (ball_x_reg + ball_x_speed) when (ball_x_dir = '1' and running = '1') else
				(ball_x_reg - ball_x_speed);

ball_y_n <= (ball_y_reg + ball_y_speed) when (ball_y_dir = '1' and running = '1') else
				(ball_y_reg - ball_y_speed);

paddle_y_n <= (paddle_y_reg + 2) when (up = '0' and down = '1' and running = '1') else
				  (paddle_y_reg - 2) when (up = '1' and down = '0' and running = '1') else
					paddle_y_reg;

delay <= (others => '1') when (speed = '1') else
				"0111111111";


hit_paddle <= '1' when (ball_x_reg < 23 and ball_y_reg > (paddle_y_reg - 30) and 
								ball_y_reg < (paddle_y_reg + 30) and ball_x_dir = '0') else
				 '0';


ball_y_speed <= "00000000001" when (hit_paddle = '1' and ball_y_reg > (paddle_y_reg - 15) and 
												ball_y_reg < (paddle_y_reg + 15)) else
												"00000000010" when (hit_paddle = '1') else
												ball_y_speed;


ball_x <= std_logic_vector(ball_x_reg);
ball_y <= std_logic_vector(ball_y_reg);
test <= std_logic_vector(delay_reg);
paddle_y <= std_logic_vector(paddle_y_reg);


delay_reg_next <= delay_reg + 1;


	process(clk, reset) is
	begin
		if(reset = '1') then
			delay_reg <= (others => '0');
		elsif(rising_edge(clk) and v_completed = '1') then
			if(delay_reg = (delay-1)) then
				delay_reg <= (others => '0');
			else
				delay_reg <= delay_reg_next;
			end if;
		else
			delay_reg <= delay_reg;
		end if;
	end process;


	process(delay_reg, reset, clk, v_completed) is
	begin
		if(reset = '1') then
			ball_x_reg <= "00100000000";
			ball_y_reg <= "00100000000";
			paddle_y_reg <= "00100000000";
		elsif(rising_edge(clk) and delay_reg = (delay - 2) and v_completed = '1' and running = '1') then
			ball_x_reg <= ball_x_n;
			ball_y_reg <= ball_y_n;
			paddle_y_reg <= paddle_y_n;
		else
			ball_x_reg <= ball_x_reg;
			ball_y_reg <= ball_y_reg;
			paddle_y_reg <= paddle_y_reg;
		end if;
	end process;


	process(reset, clk, paddle_y_reg, ball_x_reg, ball_y_reg, v_completed, running, delay_reg) is
	begin
		if(reset = '1') then
			ball_x_dir <= '1';
			ball_y_dir <= '1';
			running <= '1';
		elsif(rising_edge(clk) and running = '1') then
			if(hit_paddle = '1') then
				ball_x_dir <= '1';
			else 
				if(ball_x_reg > 635) then
					ball_x_dir <= '0';
				elsif(ball_x_reg <= 7) then
					running <= '0';
				else
					ball_x_dir <= ball_x_dir;
				end if;
				if(ball_y_reg < 5) then
					ball_y_dir <= '1';
				elsif(ball_y_reg > 475) then
					ball_y_dir <= '0';
				else
					ball_y_dir <= ball_y_dir;
				end if;
			end if;
		else
			ball_y_dir <= ball_y_dir;
			ball_x_dir <= ball_x_dir;
			running <= running;
		end if;
	end process;

end Behavioral;


