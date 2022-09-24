----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.09.2022 11:57:51
-- Design Name: 
-- Module Name: Clock_25s - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Clock_25s is
    Port ( CLK_in : in STD_LOGIC;
           CLK_out : out STD_LOGIC;
           Tl: out std_logic );
end Clock_25s;

architecture Behavioral of Clock_25s is
    signal prescaler : integer range 0 to 1250_000_000 := 1250_000_000; 
    signal counter : integer range 1 to 1250_000_000 := 1; 
    signal newClock : std_logic := '0'; 
begin
    COntagem1 : process(clk_in) 
          begin 
              if rising_edge(clk_in) then 
                  if (counter = prescaler) then 
                      counter <= 1; 
                      newClock <= not newClock;
                      tl <='0';
                  else 
                        Counter <= counter +1; 
                        Tl <='1';
                  end if; 
              end if; 
          end process;
   
      clk_out <= newClock; 

end Behavioral;
