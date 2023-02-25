library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux_3bit_4to1 is
--  Port ( );
end tb_mux_3bit_4to1;

architecture Behavioral of tb_mux_3bit_4to1 is

    -- Local signals
    signal s_a_i              : std_logic_vector(2 downto 0);
    signal s_b_i              : std_logic_vector(2 downto 0);
    signal s_c_i              : std_logic_vector(2 downto 0);
    signal s_d_i              : std_logic_vector(2 downto 0);
    signal s_f_o              : std_logic_vector(2 downto 0);
    signal s_sel_i            : std_logic_vector(1 downto 0);

begin
    -- Connecting testbench signals with comparator_2bit
    -- entity (Unit Under Test)
    uut_tb_mux_3bit_4to1 : entity work.tb_mux_3bit_4to1
        port map(
            a_i      => s_a_i,    
            b_i      => s_b_i,    
            c_i      => s_c_i,    
            d_i      => s_d_i,    
            f_o      => s_f_o,    
            sel_i    => s_sel_i  
        );

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

        s_a_i  <= "011";
        s_b_i  <= "010";
        s_c_i  <= "001";
        s_d_i  <= "000";
        
        wait for 100 ns;
        
        s_sel_i  <= "00";
        -- Expected output
        assert (s_f_0 = "011")
        -- If false, then report an error
        report "Input selector 000 FAILED" severity error;
        wait for 100 ns;
        
        s_sel_i  <= "01";
        -- Expected output
        assert (s_f_0 = "10")
        -- If false, then report an error
        report "Input selector 001 FAILED" severity error;
        wait for 100 ns;
        
        s_sel_i  <= "10";
        -- Expected output
        assert (s_f_0 = "001")
        -- If false, then report an error
        report "Input selector 10 FAILED" severity error;
        wait for 100 ns;
        
        s_sel_i  <= "11";
        -- Expected output
        assert (s_f_0 = "000")
        -- If false, then report an error
        report "Input selector 11 FAILED" severity error;
        wait for 100 ns;

        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;
