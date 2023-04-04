library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UART_transmitter is
    Port ( SW : in STD_LOGIC_VECTOR (7 downto 0);
           BTNC : in STD_LOGIC;
           TX : out STD_LOGIC;
           CLK : in STD_LOGIC);
end UART_transmitter;

architecture Behavioral of UART_transmitter is

    signal s_act  : std_logic := '0';
    signal s_cnt  : std_logic := '0';
    signal s_TX_frame  : std_logic_vector(9 downto 0);
    
begin
                -- create a signal with the entire frame
                s_TX_frame(0) <= '0';
                s_TX_frame(1) <= SW(0);
                s_TX_frame(2) <= SW(1);
                s_TX_frame(3) <= SW(2);
                s_TX_frame(4) <= SW(3);
                s_TX_frame(5) <= SW(4);
                s_TX_frame(6) <= SW(5);
                s_TX_frame(7) <= SW(6);
                s_TX_frame(8) <= SW(7);
                s_TX_frame(9) <= '1';  
                
    UART_send : process (BTNC, CLK) is
        begin
            if (rising_edge(CLK) and BTNC = '1') then
                     
            end if;
    end process UART_send;    
    
    
end Behavioral;
