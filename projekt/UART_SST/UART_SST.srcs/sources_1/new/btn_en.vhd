-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
entity ButtonPulse is
    generic(
        g_max : natural := 20
    );
    port (
        i_btn : in std_logic;
        clk : in std_logic;
        o_pulse : out std_logic
    );
end entity ButtonPulse;

architecture Behavioral of ButtonPulse is
    signal sig_cnt : natural;
begin
    btn_enable : process(clk)
    begin
        if rising_edge(clk) then
            if i_btn = '1' and sig_cnt = 0 then
                o_pulse      <= '1';
                sig_cnt <= sig_cnt + 1;           
            elsif sig_cnt > 0 and sig_cnt <= g_max then
                sig_cnt <= sig_cnt + 1;
                o_pulse      <= '0';
            else
                sig_cnt <= 0;
                o_pulse      <= '0';
            end if;
        end if;
    end process ;
    
    
end architecture Behavioral;