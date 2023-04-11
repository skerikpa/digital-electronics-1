-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_tx is
end tb_tx;

architecture testbench of tb_tx is
--signal s_msb_index : natural := 7;
signal sig_data : std_logic;
signal sig_WORD : std_logic_vector(7 downto 0) := "10011011";
signal sig_btn : std_logic := '0';

constant c_CLK_100MHZ_PERIOD : time := 10 ns;
signal sig_clk_100MHz : std_logic := '0';


begin
	uut_Tranceiver : entity work.Tranceiver
    	port map(
        	o_data => sig_data,
    		i_data_word => sig_WORD,
    		i_CLK => sig_clk_100MHz,
    		i_btn => sig_btn       	
        );

	p_clk_gen : process
    begin
        while now < 300 ns loop -- 30 periods of 100MHz clock
            sig_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            sig_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;                -- Process is suspended forever
    end process p_clk_gen;
	
    p_btn_gen : process
    begin
    wait for 50 ns;
    sig_btn <= '1';
    wait for 14 ns;
    sig_btn <= '0';
    wait;
    end process p_btn_gen;




end testbench;