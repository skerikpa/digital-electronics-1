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
    Port ( CLK100MHZ : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (7 downto 0);
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           DP : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           BTNC : in STD_LOGIC;
           BTNR : in STD_LOGIC;
           r_word : in STD_LOGIC_VECTOR (7 downto 0);
           JC_i : in STD_LOGIC;
           JB_o : out STD_LOGIC
           );
end top;

----------------------------------------------------------
-- Architecture body for top level
----------------------------------------------------------
architecture behavioral of top is

signal sig_word_i : std_logic_vector(7 downto 0) := "00000000";

begin

  --------------------------------------------------------
  -- Instance (copy) of driver_7seg_4digits entity
  --------------------------------------------------------
  driver_seg_4 : entity work.driver_7seg_4digits
      port map (
          clk      => CLK100MHZ,
          rst      => BTNC,
          data3(3) => sig_word_i(7),
          data3(2) => sig_word_i(6),
          data3(1) => sig_word_i(5),
          data3(0) => sig_word_i(4),
          
          data2(3) => sig_word_i(3),
          data2(2) => sig_word_i(2),
          data2(1) => sig_word_i(1),
          data2(0) => sig_word_i(0),
          
          data1(3) => SW(7),
          data1(2) => SW(6),
          data1(1) => SW(5),
          data1(0) => SW(4),
          
          data0(3) => SW(3),
          data0(2) => SW(2),
          data0(1) => SW(1),
          data0(0) => SW(0),

          -- DECIMAL POINT
          dp_vect => "0111",
          dp      => DP,

          seg(6) => CA,      
          seg(5) => CB,
          seg(4) => CC,
          seg(3) => CD,
          seg(2) => CE,
          seg(1) => CF,
          seg(0) => CG,


          -- DIGITS
          dig(7 downto 0) => AN(7 downto 0)
      );

  
driver_Receiver : entity work.Receiver
    generic map(
        MSB_INDEX => 7
    )
    port map(
        i_data => JC_i,
        i_CLK => CLK100MHZ,
        o_data_word => sig_word_i
    );
    
driver_Transmitter : entity work.Tranceiver
    generic map(
        MSB_INDEX => 7
    )
    port map (
        i_data_word => SW,
        i_clk => CLK100MHZ,
        i_btn => BTNR,
        o_data => JB_o        
    );

end architecture behavioral;
