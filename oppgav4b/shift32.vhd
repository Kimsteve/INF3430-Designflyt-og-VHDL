library ieee;
use ieee.std_logic_1164.all;
ENTITY shift32 IS
		port ( 
		rst_n     : in  std_logic;   -- Reset
		mclk      : in  std_logic;   -- Clock
		din       : in  std_logic;   -- Data in
		dout      : out std_logic    -- Data out	
    );	
END shift32;

architecture shiftreg of shift32 IS
		
		COMPONENT dff 
			 port ( rst_n     : in  std_logic;  
				mclk      : in  std_logic;   
				din       : in  std_logic;  
				dout      : out std_logic   
  );
  END COMPONENT;
  signal connection : STD_LOGIC_VECTOR( 0 to 31);


BEGIN
	gen: for i in 0 to 31 generate
	begin 
		
			shiftf1: COMPONENT dff
			-- no connection(i-1) here thus connected  to din
			port map (din=>din, mclk=>mclk, rst_n=>rst_n, dout=>connection(0));
		
		
		shiftrest : if ((i >= 1) and (i < 31)) generate
		begin
		shiftf : component dff
		  port map (din=>connection(i-1), mclk=>mclk, rst_n=>rst_n, dout=>connection(i));
		
		end generate shiftrest;
 
			shiftf: component dff	
				port map (din=>connection(30), mclk=>mclk, rst_n=>rst_n, dout=>connection(31));
		
	end generate gen;
	dout <= connection(31);  --the last for dout
END shiftreg;