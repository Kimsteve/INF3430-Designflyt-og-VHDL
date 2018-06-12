
library ieee;

use ieee.std_logic_1164.all;



entity decoder2_to_4 is
    Port ( 
            --signal  MCLK        : std_logic := '0'; --:= initial value
            sel : in  STD_LOGIC_VECTOR(1 DOWNTO 0);
            y   : out  STD_LOGIC_VECTOR(3 DOWNTO 0)
			  );
         
end decoder2_to_4;

architecture Behavioral of decoder2_to_4 is

begin	
	process(sel)
		begin
			case sel is 
				when "00" => y <= "0111";
				when "01" => y <= "1011";
				when "10" => y <= "1101";
				when "11" => y <= "1110";
				when others =>y<= "1111";
			end case;
		end process;


end Behavioral;

