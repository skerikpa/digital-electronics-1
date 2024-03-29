# Lab 5: Patrik Škeřík

### D & T Flip-flops

1. Screenshot with simulated time waveforms. Try to simulate both D- and T-type flip-flops in a single testbench with a maximum duration of 200 ns, including reset. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![your figure](images/waveforms.PNG)

### JK Flip-flop

1. Listing of VHDL architecture for JK-type flip-flop. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
architecture Behavioral of jk_ff_rst is
signal sig_q : std_logic;
begin
    p_jk_ff_rst : process (clk)
    begin
        if rising_edge(clk) then  -- Synchronous process
            if (rst = '1' or (j = '0' and k = '1')) then --synchronous reset and reset by input
                sig_q   <= '0';
            elsif(j = '0' and k = '0') then -- no change
                sig_q   <= sig_q;
            elsif(j = '1' and k = '0') then --set
            	sig_q 	<= '1';
            else sig_q <= not sig_q; 	    --toggle           
            end if;
        end if;
    end process p_jk_ff_rst;

    -- Output ports are permanently connected to local signal
    q     <= sig_q;
    q_bar <= not sig_q;
end architecture Behavioral;
```

### Shift register

1. Image of `top` level schematic of the 4-bit shift register. Use four D-type flip-flops and connect them properly. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components and internal signals!

   ![your figure](images/4_bit_shifter_sigs.png)
