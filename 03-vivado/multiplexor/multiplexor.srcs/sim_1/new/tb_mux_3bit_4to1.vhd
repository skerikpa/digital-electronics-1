library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux_3bit_4to1 is
--  Port ( );
end tb_mux_3bit_4to1;

architecture Behavioral of tb_mux_3bit_4to1 is
    signal s_a_i              : std_logic_vector(2 downto 0);
    signal s_b_i              : std_logic_vector(2 downto 0);
    signal s_c_i              : std_logic_vector(2 downto 0);
    signal s_d_i              : std_logic_vector(2 downto 0);
    signal s_f_o              : std_logic;
    signal s_sel_i            : std_logic_vector(1 downto 0);

begin
    uut_mux_3bit_4to1 : entity work.mux_3bit_4to1
        port map(
            a_i      => s_a_i,    
            b_i      => s_b_i,    
            c_i      => s_c_i,    
            d_i      => s_d_i,    
            f_o      => s_f_o,    
            sel_i    => s_sel_i  
            );
            
        begin

        -- First test case
        s_a_i  <= "011";
        s_b_i  <= "010";
        s_c_i  <= "001";
        s_d_i  <= "000";
        wait for 100 ns;
       

            
end architecture testbench;
