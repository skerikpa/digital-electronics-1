library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_tlc is
--  Port ( );
end tb_tlc;

architecture Behavioral of tb_tlc is

-- Local constants
  constant c_CLK_100MHZ_PERIOD : time := 10 ns;

  -- Local signals
  signal sig_clk_100mhz : std_logic;
  signal sig_rst        : std_logic;
  signal sig_south      : std_logic_vector(2 downto 0);
  signal sig_west       : std_logic_vector(2 downto 0);

begin

  -- Connecting testbench signals with tlc entity
  -- (Unit Under Test)
  uut_tlc : entity work.tlc
    port map (
      clk   => sig_clk_100mhz,
      rst   => sig_rst,
      south => sig_south,
      west  => sig_west
    );

  --------------------------------------------------------
  -- Clock generation process
  --------------------------------------------------------
  p_clk_gen : process is
  begin

    while now < 10000 ns loop -- 10 usec of simulation

      sig_clk_100mhz <= '0';
      wait for c_CLK_100MHZ_PERIOD / 2;
      sig_clk_100mhz <= '1';
      wait for c_CLK_100MHZ_PERIOD / 2;

    end loop;

    wait;

  end process p_clk_gen;

  --------------------------------------------------------
  -- Reset generation process
  --------------------------------------------------------
  p_reset_gen : process is
  begin

    sig_rst <= '0';
    wait for 200 ns;

    -- Reset activated
    sig_rst <= '1';
    wait for 500 ns;

    -- Reset deactivated
    sig_rst <= '0';
    wait;

  end process p_reset_gen;

  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
  p_stimulus : process is
  begin

    report "Stimulus process started";
    -- No other input data is needed.
    report "Stimulus process finished";
    wait;

  end process p_stimulus;
end Behavioral;
