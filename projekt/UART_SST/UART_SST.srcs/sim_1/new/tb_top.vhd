----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2023 01:25:36 AM
-- Design Name: 
-- Module Name: tb_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_top is
--  Port ( );
end tb_top;




architecture Behavioral of tb_top is

signal sig_SW_i : std_logic_vector(7 downto 0) := "00010110";
signal sig_JC_i : std_logic;
signal sig_JB_o : std_logic;
signal sig_btnr : std_logic := '0';
signal sig_clk_100MHz : std_logic;
signal sig_7S_LEDs : std_logic_vector (6 downto 0);
signal sig_dp : std_logic;
signal sig_received_WORD : std_logic_vector(7 downto 0);


constant c_CLK_100MHZ_PERIOD : time := 10 ns;


begin

uut_top : entity work.top
    port map(
           CLK100MHZ => sig_clk_100MHz,
           SW => sig_SW_i,
           --CA => sig_7S_LEDs(0),        
           --CB => sig_7S_LEDs(1),
           --CC => sig_7S_LEDs(2),
           --CD => sig_7S_LEDs(3),
           --CE => sig_7S_LEDs(4),
           --CF => sig_7S_LEDs(5),
           --CG => sig_7S_LEDs(6),
           --DP => sig_dp,
           --AN => "00000000",
           BTNC => '0',
           BTNR => sig_btnr,
           --r_word => sig_received_WORD,
           JC_i => sig_JC_i,
           JB_o => sig_JB_o
    );
    
   p_clk_gen : process
    begin
        while now < 1200 ns loop -- 30 periods of 100MHz clock
            sig_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            sig_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;                -- Process is suspended forever
    end process p_clk_gen; 
    
   p_data_gen : process
        begin
           sig_SW_i <= "01001011";
           wait for 200 ns;
           sig_btnr <= '1';
           --wait for 14 ns;
           --sig_btnr <= '0';
            
        
        wait;
   end process p_data_gen;

sig_JC_i <= sig_JB_o;

end Behavioral;
