----------------------------------------------------------------------------------
-- Company: UnB -FGA
-- Engineer: Guilherme Rodrigues , Pedro Lucas Garcia, Ana Beatriz Norberto
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
           Rst: in std_logic ;
           CLK_out : out STD_LOGIC;
           Tl: out std_logic );
end Clock_25s;

architecture Behavioral of Clock_25s is
    signal prescaler : integer range 0 to 1250_000_000 := 1250_000_000; 
    signal counter, counter2 : integer range 1 to 1250_000_000 := 1; 
    signal newClock, srst : std_logic := '0'; 
    signal stl: std_logic := '1';
begin
    tl <= stl;
   resetando: process(rst)
   begin
      srst <= rst;
   end process ;
   
   COntagem1 : process(clk_in) 
         begin 
             if rising_edge(clk_in) then 
                  if srst ='1' then
                     newClock <= '0';
                     counter <= 1; 
                     counter2 <= 1;
                     sTl <= '1';
                  elsif not(counter = prescaler) then 
                     counter <= counter +1;
                     stl <= '1';
                 elsif counter2 = prescaler then 
                       Counter <= 1; 
                       Counter2 <= 1; 
                       newClock <= not newClock;
                       sTl <='0';
                 else
                       counter2 <= counter2 +1;
                       stl <= '1';
                 end if; 
             end if; 
         end process;
  
     clk_out <= newClock; 


end Behavioral;
