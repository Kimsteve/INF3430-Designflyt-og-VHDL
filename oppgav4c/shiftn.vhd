library ieee;
use ieee.std_logic_1164.all;
ENTITY shiftn IS
  generic(n: integer);
		port ( 
		rst_n     : in  std_logic;   -- Reset
		mclk      : in  std_logic;   -- Clock
		din       : in  std_logic;   -- Data in
		dout      : out std_logic    -- Data out	
    );	
END shiftn;

architecture shiftreg of shiftn IS
		
		COMPONENT dff 
		  
			 port ( rst_n     : in  std_logic;  
				mclk      : in  std_logic;   
				din       : in  std_logic;  
				dout      : out std_logic   
     );
     
  END COMPONENT;
  
  signal connection : STD_LOGIC_VECTOR( 0 to n-1);


BEGIN

	gen: for i in 0 to n-1 generate
	begin 
		--shiftfirst: if i = 0 generate
		--begin
			shiftf1: COMPONENT dff
			-- no connection(i-1) here thus connected  to din
			port map (din=>din, mclk=>mclk, rst_n=>rst_n, dout=>connection(0));
		--end generate shiftfirst;
		
		shiftrest : if ((i >= 1) and (i < n-1)) generate
		begin
		shiftf : component dff
		  port map (din=>connection(i-1), mclk=>mclk, rst_n=>rst_n, dout=>connection(i));
		
		end generate shiftrest;

		--shiftlast:  if i = n-1 generate
		--begin 
			shiftf: component dff	
				port map (din=>connection(n-2), mclk=>mclk, rst_n=>rst_n, dout=>connection(n-1));
			
		--end generate shiftlast;
	end generate gen;
	dout <= connection(n-1);  --the last for dout
END shiftreg;