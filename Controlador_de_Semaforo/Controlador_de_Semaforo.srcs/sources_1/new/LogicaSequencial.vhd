----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.09.2022 09:03:30
-- Design Name: 
-- Module Name: LogicaSequencial - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LogicaSequencial is
    Port ( Vs : in STD_LOGIC;
           CLKin : in STD_LOGIC;
           TL : in STD_LOGIC;
           Ts : in STD_LOGIC;
           G : out STD_LOGIC_VECTOR (0 to 1));
end LogicaSequencial;

architecture Behavioral of LogicaSequencial is

begin


end Behavioral;
