----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.09.2022 08:31:23
-- Design Name: 
-- Module Name: controladorSemaforo - Behavioral
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

entity controladorSemaforo is
    Port ( Vs : in STD_LOGIC;
           TL : in STD_LOGIC;
           Ts : in STD_LOGIC;
           Mg : out STD_LOGIC;
           My : out STD_LOGIC;
           Mr : out STD_LOGIC;
           Sg : out STD_LOGIC;
           Sy : out STD_LOGIC;
           Sr : out STD_LOGIC);
end controladorSemaforo;

architecture Behavioral of controladorSemaforo is

begin


end Behavioral;
