
library IEEE; --makes the library IEEE visible
use IEEE.std_logic_1164.all; --makes use of the package std_logic_1164
use IEEE.numeric_std.all;    --makes use of the package numeric_std


entity FIRST is 
  port
  (
  --Signalname : <mode> <data_type>; mode: in, out or inout
    CLK        : in  std_logic; -- Clock from switch CLK1/INP1
    RESET      : in  std_logic; -- Global Asynchronous Reset
    LOAD       : in  std_logic; -- Synchronous Reset
    up         : in std_logic;
    INP        : in  std_logic_vector(3 downto 0); -- Start Value
    COUNT      : out std_logic_vector(3 downto 0); -- Counting value
    MAX_COUNT  : out std_logic; -- Max counting value 
    MIN_COUNT  : out std_logic  -- Max counting value 
  );
end FIRST;

architecture MY_FIRST_ARCH of FIRST is
 
  
  signal COUNT_I : unsigned(3 downto 0);

begin

  COUNTER: --This is a label which will be visible inside the simulator
  process (RESET,CLK) --sensitivity list, include all input signals to the process
                      --which matters for the functionality of the process
  begin
    
    if(RESET  = '1') then
      COUNT_I <= "0000";
    
    elsif rising_edge(CLK) then
      if LOAD = '1' then
        COUNT_I <= unsigned(INP);
      elsif up ='1' then    
        COUNT_I <= COUNT_I + 1;
		elsif up = '0' then 
		 COUNT_I <= COUNT_I - 1;	
      end if; 
    end if; 
  end process COUNTER;

 
  COUNT <= std_logic_vector(COUNT_I);
  
  --Concurrent signal assignment (CSA)
  MAX_COUNT <= '1' when COUNT_I = "1111" and up = '1' else '0';
  MIN_COUNT <= '1' when COUNT_I = "1111" and up = '0' else '0';
  
  
  
  
end MY_FIRST_ARCH;
