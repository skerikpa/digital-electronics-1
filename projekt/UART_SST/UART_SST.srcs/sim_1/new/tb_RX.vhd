-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_rx is
end tb_rx;

architecture testbench of tb_rx is
--signal s_msb_index : natural := 7;
signal sig_data : std_logic := '0';
signal sig_WORD : std_logic_vector(7 downto 0) := "00000000";
signal sig_data_updated : std_logic := '0';

signal s_received_message : std_logic_vector(7 downto 0) := "00000000";

constant c_CLK_100MHZ_PERIOD : time := 10 ns;
signal sig_clk_100MHz : std_logic := '0';


begin
	uut_Receiver : entity work.Receiver
    	port map(
        	i_data 					=> sig_data,
    		o_data_word 			=> sig_WORD,
    		i_CLK 					=> sig_clk_100MHz, 
            o_data_updated_signal 	=> sig_data_updated
        );

	p_clk_gen : process
    begin
        while now < 600 ns loop -- 30 periods of 100MHz clock
            sig_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            sig_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;                -- Process is suspended forever
    end process p_clk_gen;
    
    uut_word_gen : process
    begin
    	wait on sig_data_updated;
        wait until rising_edge(sig_data_updated);
        s_received_message <= sig_WORD;
        wait;
    end process uut_word_gen;


    p_data_gen : process
    begin
	wait for 17 ns;
    sig_data <= '1';
    wait for 74 ns;
    sig_data <= '0';
    wait for 10 ns;
    sig_data <= '1';
    wait for 10 ns;
    sig_data <= '1';
    wait for 10 ns;
    sig_data <= '0';
    wait for 10 ns;
    sig_data <= '1';
    wait for 10 ns;
    sig_data <= '1';
    wait for 10 ns;
    sig_data <= '0';
    wait for 10 ns;
    sig_data <= '0';
    wait for 10 ns;
    sig_data <= '1';
    wait for 10 ns;
    sig_data <= '1';
    wait for 52 ns;
    sig_data <= '0';
    wait;
    end process p_data_gen;




end testbench;