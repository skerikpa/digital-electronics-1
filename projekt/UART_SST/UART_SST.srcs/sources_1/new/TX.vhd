-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;


entity Tranceiver is
	generic(
    	MSB_INDEX : natural := 7;
    	clock_en_g_max : natural := 1
    );
	port (
    o_data : out std_logic;
    i_data_word : in std_logic_vector(MSB_INDEX downto 0);
    i_CLK : in std_logic;
    i_btn : in std_logic;
    i_rst : in std_logic
    );

end Tranceiver;

architecture behavioral of Tranceiver is

type T_STATE is
      (WAITING, TRANSMISSION);
signal CURRENT_STATE : T_STATE := WAITING;

signal counter : natural := 0;
signal current_bit : std_logic := '1';

signal CLK_en : std_logic;
begin

clk_en0 : entity work.clock_enable
generic map (g_max => clock_en_g_max) -- Change to 5000 for implement, 5 for TB
port map (
    clk => i_CLK,
    rst => i_rst,
    ce => CLK_en
);

tx : process(i_CLK, i_rst)
begin
    if i_rst = '1' then
        current_bit <= '1';
        CURRENT_STATE <= WAITING;
	elsif rising_edge(i_CLK) and CLK_en = '1' then
    case CURRENT_STATE is
    when WAITING =>
    	if i_btn = '1' then
    		CURRENT_STATE <= TRANSMISSION;
            current_bit <= '0';
        else
        	current_bit <= '1';
    	end if;
    when TRANSMISSION =>
    	if counter <= MSB_INDEX then
			current_bit <= i_data_word(counter);
        	counter <= counter + 1;
        else
        	current_bit <= '1';
            counter <= 0;
            CURRENT_STATE <= WAITING;
    	end if;
    end case;
    end if;
    

end process tx;

o_data <= current_bit;


end behavioral;