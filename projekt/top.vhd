----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2023 11:40:35 AM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( SW : in STD_LOGIC_VECTOR (7 downto 0);
           BTNC : in STD_LOGIC;
           BTNL : in STD_LOGIC;
           CLK100MHZ : in STD_LOGIC;
           SWh : in STD_LOGIC;
           JB_o : out STD_LOGIC;
           JC_i : in STD_LOGIC;
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is

begin

driver_Transmitter_top : entity work.Tranceiver
    port map(
    i_CLK => CLK100MHZ,
    i_btn => BTNC,
    i_data_word => SW,
    o_data => JB_o);
    
driver_Receiver_top : entity work.Receiver
      port map(
          i_data => JC_i,
          i_CLK => CLK100MHZ
          );    

driver_7seg : entity work.driver_7seg_4digits
      port map(
          clk      => CLK100MHZ,
          rst      => BTNL,
          dp_vect => "1111",
          
          data3(3) => '0',
          data3(2) => '1',
          data3(1) => '1',
          data3(0) => '1',
          
          data2(3) => '1',
          data2(2) => '1',
          data2(1) => '1',
          data2(0) => '1',
          
          data1(3) => SW(7),
          data1(2) => SW(6),
          data1(1) => SW(5),
          data1(0) => SW(4),
          
          data0(3) => SW(3),
          data0(2) => SW(2),
          data0(1) => SW(1),
          data0(0) => SW(0),
          
          -- DIGITS
          dig(7 downto 0) => AN(7 downto 0)
    );
    

end Behavioral;
