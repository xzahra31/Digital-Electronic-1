library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for top level
------------------------------------------------------------------------
entity top is
    port (SW0, SW1:           in  std_logic;
          BTN0, BTN1:         in  std_logic;
          LD0, LD1, LD2, LD3: out std_logic;
          disp_seg_o:         out std_logic_vector(7-1 downto 0);
          disp_dig_o:         out std_logic_vector(4-1 downto 0));
end entity top;

------------------------------------------------------------------------
-- Architecture declaration for top level
------------------------------------------------------------------------
architecture Behavioral of top is
    signal s_hex: std_logic_vector(4-1 downto 0);   -- Internal signals
begin

    -- Combine inputs [SW1, SW0, BTN1, BTN0] into internal vector
    s_hex(3) <= SW1;
    s_hex(2) <= SW0;
    s_hex(1) <= not BTN1;
    s_hex(0) <= not BTN0;


    --------------------------------------------------------------------
    -- Sub-block of hex_to_7seg entity
    HEX2SSEG: entity work.hex_to_7seg
        port map (-- <entity port_name> => <signal_name>,
                  -- <entity port_name> => <signal_name>,
                  -- ...
                  -- <entity port_name> => <signal_name>);
                  hex_i => s_hex,
                  seg_o => disp_seg_o);

    -- Select display position
    disp_dig_o <= "1110";


    -- Turn on LD3 if the input value is equal to "0000"
    -- WRITE YOUR CODE HERE
	LD3 <= not s_hex(3) and not s_hex(2) and not s_hex(1) and not s_hex(0);
	 
    -- Turn on LD2 if the input value is A, B, C, D, E, or F
    -- WRITE YOUR CODE HERE
--	 LD2 <= 

    -- Turn on LD1 if the input value is odd, ie 1, 2, 3, etc.
    -- WRITE YOUR CODE HERE

    -- Turn on LD0 if the input value is a power of two, ie 1, 2, 4, or 8.
    -- WRITE YOUR CODE HERE

end architecture Behavioral;