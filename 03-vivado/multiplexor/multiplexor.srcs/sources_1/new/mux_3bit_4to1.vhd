library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_3bit_4to1 is
    port(
        a_i              : in  std_logic_vector(2 downto 0);
        b_i              : in  std_logic_vector(2 downto 0);
        c_i              : in  std_logic_vector(2 downto 0);
        d_i              : in  std_logic_vector(2 downto 0);
        f_o              : out std_logic_vector(2 downto 0);
        sel_i            : in std_logic_vector(1 downto 0)
    );
end mux_3bit_4to1;

architecture Behavioral of mux_3bit_4to1 is

begin
    f_o <=  a_i when (sel_i = "000") else
            b_i when (sel_i = "001") else
            c_i when (sel_i = "010") else
            d_i; 

end Behavioral;
