-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
entity ButtonPulse is
    generic(
        g_max : natural := 3;
        clock_en_g_max : natural := 1
    );
    port (
        i_btn : in std_logic;
        i_rst : in std_logic;
        i_CLK : in std_logic;
        o_pulse : out std_logic
    );
end entity ButtonPulse;

architecture Behavioral of ButtonPulse is
    signal sig_cnt : natural;
    signal CLK_en : std_logic;
      
begin
clk_en0 : entity work.clock_enable
generic map (g_max => clock_en_g_max)
port map (
    clk => i_CLK,
    rst => i_rst,
    ce => CLK_en
);


btn_enable : process(i_CLK, i_rst)
    begin
        if i_rst = '1' then
            sig_cnt <= 0;
            o_pulse <= '0';
        elsif rising_edge(i_CLK) and clk_en = '1' then
            if i_btn = '1' and sig_cnt = 0 then
                o_pulse      <= '1';
                sig_cnt <= sig_cnt + 1;           
            elsif sig_cnt > 0 and sig_cnt <= g_max then
                sig_cnt <= sig_cnt + 1;
                o_pulse      <= '0';
            else
                sig_cnt <= 0;
                o_pulse <= '0';
            end if;
        end if;
    end process ;
    
    
    
end architecture Behavioral;