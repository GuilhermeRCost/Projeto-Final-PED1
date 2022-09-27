----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.09.2022 23:23:02
-- Design Name: 
-- Module Name: Estados_tb - Behavioral
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

entity Estados_tb is
--  Port ( );
end Estados_tb;

architecture Behavioral of Estados_tb is
    component Maquina_de_Estados
        Port ( CLK: in STD_LOGIC;
               tl: in std_logic ;
               ts: in std_logic ;
               Vs : in STD_LOGIC;
               Mg : out STD_LOGIC;
               My : out STD_LOGIC;
               Mr : out STD_LOGIC;
               Sg : out STD_LOGIC;
               Sy : out STD_LOGIC;
               Sr : out STD_LOGIC;
               reset: out std_logic);
    end component ;
    signal sclk, svs, sreset, stl, sts: std_logic ;
    signal sM, sS: std_logic_vector (0 to 2);
begin
    utt: Maquina_de_Estados port map(clk => sclk, vs => svs,tl => stl, ts =>sts,
                                         Mg => sM(0), My => sM(1), Mr => sM(2),
                                          sg => ss(0), sy => ss(1), sr => ss(2),
                                        reset=> sreset );
    sinalClock: process
    begin
        sclk<= '0'; wait for 10ns;
        sclk <= '1'; wait for 10ns;
    end process;
    
    condicoesEstados: process
    begin
        stl <='1'; sts <= '1'; svs <= '0'; wait for 5ns; --iniciando as variaveis
        svs <='1'; wait for 20ns; --carro detectado e1 --> e2
        Sts <= '0'; wait for 6ns; sts <= '1'; wait for 15ns;  --"Passou" 4s no e2; e2--> e3
        stl <= '0'; wait for 5ns; stl<= '1'; wait for 8ns;  --passou 25s no estagio 3; e3 --> e4
        sts <= '0'; wait for 20ns; sts <='1'; wait; --passou  4s no estagio 4; e4 -->e1
    end process;
end Behavioral;
