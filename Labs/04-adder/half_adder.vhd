----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for half adder
------------------------------------------------------------------------
entity half_adder is
    port (b_i:     in  std_logic;
          a_i:     in  std_logic;
          carry_o: out std_logic;
          sum_o:   out std_logic);
end entity half_adder;

------------------------------------------------------------------------
-- Architecture declaration for half adder
------------------------------------------------------------------------
architecture Behavioral of half_adder is
begin
  sum_o <= a_i xor b_i;
carry_o <= a_i and b_i;
  
  
			 -- Logic functions for carry and sum outputs
    -- WRITE YOUR CODE HERE

end architecture Behavioral;

