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
    Port ( CLK: in STD_LOGIC;
           Vs : in STD_LOGIC;
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
    --instanciando componentes
    component LogicaSequencial
        Port ( Vs : in STD_LOGIC;
               CLKin : in STD_LOGIC;
               TL : in STD_LOGIC;
               Ts : in STD_LOGIC;
               G : out STD_LOGIC_VECTOR (0 to 1));
        end component;
    component DecodificadorGray
        Port ( G : in STD_LOGIC_VECTOR (0 to 1);
               S : out STD_LOGIC_VECTOR (0 to 3));
    end component;
    component DivisorDeFrequencia
        Port ( CLKin : in STD_LOGIC;
               CLKout : out STD_LOGIC);
    end component;
    component Seletor
        Port ( S1 : in STD_LOGIC;
               S3 : in STD_LOGIC;
               TL : out STD_LOGIC;
               Ts : out STD_LOGIC);
    end component;
    component Timer
        Port ( CLK : in STD_LOGIC;
               TL : out STD_LOGIC;
               Ts : out STD_LOGIC);
    end component;
begin


end Behavioral;
