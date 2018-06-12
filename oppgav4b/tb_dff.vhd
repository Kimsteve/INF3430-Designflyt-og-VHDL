

LIBRARY ieee;

USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using

-- arithmetic functions with Signed or Unsigned values

--USE ieee.numeric_std.ALL;
ENTITY tb_dff IS
END tb_dff;

ARCHITECTURE behavior OF tb_dff IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT shift32
      port ( 
       -- System Clock and Reset
      rst_n     : in  std_logic;   -- Reset
      mclk      : in  std_logic;   -- Clock
    -- Shifted data in and out
      din       : in  std_logic;   -- Data in
      dout      : out std_logic    -- Data out
      );
    END COMPONENT;
    
   --Inputs
   signal rst_n : std_logic := '0';
   signal mclk : std_logic := '0';
   signal din : std_logic := '0';
--Outputs
  signal dout : std_logic;
-- Clock period definitions

constant Half_Period : time := 50 ns;  --50Mhz klokkefrekvens
BEGIN
	-- Instantiate the Unit Under Test (UUT)
  uut: shift32 PORT MAP (
          rst_n => rst_n,
          mclk => mclk,
          din => din,
          dout => dout
        );

 MCLK <= not MCLK after Half_Period;
   -- Stimulus process
   stim_proc: process
   begin		
		rst_n <= '0'; 
		din <='1';
		wait for 200 ns;
		rst_n <='1';
    wait;
   end process;
END;