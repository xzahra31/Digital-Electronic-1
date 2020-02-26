library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for full adder
------------------------------------------------------------------------
entity full_adder is
    port (carry_i: in  std_logic;
          b_i:     in  std_logic;
          a_i:     in  std_logic;
          carry_o: out std_logic;
          sum_o  : out std_logic);
end entity full_adder;

------------------------------------------------------------------------
-- Architecture declaration for full adder
------------------------------------------------------------------------
architecture Behavioral of full_adder is
    -- Internal signals between two half adders
    signal s_carry0, s_carry1, s_sum0: std_logic;
begin

    --------------------------------------------------------------------
    -- Sub-blocks of two half_adder entities
    HALFADDER0: entity work.half_adder
        port map (a_i=>a_i,
		            b_i=>b_i,
						carry_o=>s_carry0,
						sum_o=>s_sum0);
              

    HALFADDER1: entity work.half_adder
        port map (sum_o=>sum_o,
						a_i => s_sum0,
						b_i => carry_i,
		            carry_o=>s_carry1);
						
					
                  -- WRITE YOUR CODE HERE
		            carry_o <= s_carry1 or s_carry0;     

    -- Output carry
    -- WRITE YOUR CODE HERE
       
end architecture Behavioral;