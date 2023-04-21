-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;


entity Receiver is
	generic(
    	MSB_INDEX : natural := 7;
    	clock_en_g_max : natural := 1
    );
	port (
    	i_data 					: in std_logic;
    	o_data_word 			: out std_logic_vector(MSB_INDEX downto 0);
    	i_CLK 					: in std_logic;
    	i_rst                   : in std_logic 
    );

end Receiver;

architecture behavioral of Receiver is

--SHUTDOWN = disconnected - constant '0'
--BOOTUP = synchronization - to prevent reaction to random '1' pulse
--WAITING = connected - constant '1'

type T_STATE is
      (SHUTDOWN, BOOTUP, WAITING, READING);
signal CURRENT_STATE : T_STATE := SHUTDOWN;

signal sync_time : natural := 5;
signal counter : natural := 0;
signal reg_word : std_logic_vector(MSB_INDEX downto 0);

signal CLK_en : std_logic;

begin

clk_en0 : entity work.clock_enable
generic map (g_max => clock_en_g_max)  -- Change to 5000 for implement, 5 for TB
port map (
    clk => i_CLK,
    rst => i_rst,
    ce => CLK_en
);

rx : process(i_CLK, i_rst)
begin
    if i_rst = '1' then
        current_state <= SHUTDOWN;
        counter <= 0;
	elsif rising_edge(i_CLK) and CLK_en = '1' then
    case CURRENT_STATE is
    when SHUTDOWN =>
    	if i_data = '1' then        	
        	CURRENT_STATE <= BOOTUP;
        end if;
    when BOOTUP =>
    	if i_data = '1' and counter < sync_time then
        	counter <= counter + 1;
        elsif i_data = '1' and counter >= sync_time then
        	counter <= 0;
            CURRENT_STATE <= WAITING;
        else 
        	counter <= 0;
            CURRENT_STATE <= SHUTDOWN;
        end if;
    when WAITING =>
    	if i_data = '0' then        	
        	CURRENT_STATE <= READING;
        end if;
    when READING => 
    	if counter <= MSB_INDEX then
    		reg_word(counter) <= i_data;
        	counter <= counter + 1;
        elsif i_data = '1' then	--check for STOP_BIT
            o_data_word <= reg_word;
            counter <= 0;
        	CURRENT_STATE <= WAITING;
        else 
        	counter <= 0;
        	CURRENT_STATE <= SHUTDOWN;           
        end if;
    end case;
    end if;
    

end process rx;


end behavioral;