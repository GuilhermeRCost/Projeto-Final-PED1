----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.09.2022 19:38:33
-- Design Name: 
-- Module Name: Controlador_tb - Behavioral
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

entity Controlador_tb is
--  Port ( );
end Controlador_tb;

architecture Behavioral of Controlador_tb is

component controladorSemaforo
         Port ( CLK: in STD_LOGIC;
              Vs : in STD_LOGIC;
              Mg : out STD_LOGIC;
              My : out STD_LOGIC;
              Mr : out STD_LOGIC;
              Sg : out STD_LOGIC;
              Sy : out STD_LOGIC;
              Sr : out STD_LOGIC;
              Clk_out: out std_logic );
    end component;
    signal sclk, svs,sclk_out: std_logic ;
    signal sM, sS: std_logic_vector (0 to 2);
begin
    uut: controladorSemaforo port map(clk => sclk, vs => svs,
                                         Mg => sM(0), My => sM(1), Mr => sM(2),
                                          sg => ss(0), sy => ss(1), sr => ss(2),
                                         clk_out => sclk_out );
    Clock: process
    begin
        sclk <= '0'; wait for 0.001ns;
        sclk <= '1'; wait for 0.001ns;
    end process;
    
    sensor: process
    begin
        sVs <= '0'; wait for 30ns;
        sVs <= '1'; wait;
    end process;

end Behavioral;
