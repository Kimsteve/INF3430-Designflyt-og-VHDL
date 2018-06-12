library ieee;
use ieee.std_logic_1164.all;
ENTITY shift8 IS
  port ( 
	  -- System Clock and Reset
    rst_n     : in  std_logic;   -- Reset
    mclk      : in  std_logic;   -- Clock
    -- Shifted data in and out
    din       : in  std_logic;   -- Data in
    dout      : out std_logic    -- Data out	
    );			
END shift8;

architecture shiftreg of shift8 IS
		COMPONENT dff 
			 port ( rst_n     : in  std_logic;  
				mclk      : in  std_logic;   
				din       : in  std_logic;  
				dout      : out std_logic   
  );
END COMPONENT;

signal Q7, Q6,Q5,Q4, Q3, Q2, Q1, Q0 : STD_LOGIC;

BEGIN
-- instantiation label and component name shift and dff respectively.	
	shift7: dff port map (din=>din, mclk=>mclk, rst_n=>rst_n, dout=>Q7);
	shift6: dff port map (din=>Q7, mclk=>mclk, rst_n=>rst_n, dout=>Q6);
	shift5: dff port map (din=>Q6, mclk=>mclk, rst_n=>rst_n, dout=>Q5);
	shift4: dff port map (din=>Q5, mclk=>mclk, rst_n=>rst_n, dout=>Q4);
	shift3: dff port map (din=>Q4, mclk=>mclk, rst_n=>rst_n, dout=>Q3);
	shift2: dff port map (din=>Q3, mclk=>mclk, rst_n=>rst_n, dout=>Q2);
	shift1: dff port map (din=>Q2, mclk=>mclk, rst_n=>rst_n, dout=>Q1);
	shift0: dff port map (din=>Q1, mclk=>mclk, rst_n=>rst_n, dout=>Q0);
	dout <= Q0;
END shiftreg;