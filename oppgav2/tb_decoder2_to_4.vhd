
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY tb_decoder2_to_4 IS
END tb_decoder2_to_4;
 
ARCHITECTURE behavior OF tb_decoder2_to_4 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decoder2_to_4
    PORT(
         --MCLK        : in  std_logic;
         sel : IN  std_logic_vector(1 downto 0);
         y : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   --signal  MCLK        : std_logic := '0'; --:= initial value
   signal sel : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal y : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
  --constant Half_Period : time := 10 ns;  --50Mhz klokkefrekvens
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decoder2_to_4 PORT MAP (
          --MCLK  => MCLK,
          sel => sel,
          y => y
        );
 
-- MCLK <= not MCLK after Half_Period;
   -- Stimulus process
   stim_proc: process
   begin		
    sel <= "00";
      wait for 150 ns;	
		 sel <= "01";
      wait for 100 ns;	
		 sel <= "10";
      wait for 75 ns;	 
		sel <= "11";
      wait for 50 ns;	
		 sel <= "00";
     -- wait for 100 ns;

      wait;
   end process;

END;
