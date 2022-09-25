----------------------------------------------------------------------------------
-- Company:   UnB -FGA
-- Engineer: Guilherme Rodrigues , Pedro Lucas Garcia, Ana Beatriz Norberto
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
           Mg : out STD_LOGIC;
           My : out STD_LOGIC;
           Mr : out STD_LOGIC;
           Sg : out STD_LOGIC;
           Sy : out STD_LOGIC;
           Sr : out STD_LOGIC;
           Clk_out: out std_logic );
end controladorSemaforo;

architecture Behavioral of controladorSemaforo is
    --instanciando componentes
    component Clock_25s
        Port ( CLK_in : in STD_LOGIC;
               Rst: in std_logic ;
               CLK_out : out STD_LOGIC;
               Tl: out std_logic );
    end component ;
    
    component Clock_5s
        Port ( CLK_in : in STD_LOGIC;
               Rst: in std_logic ;
               CLK_out : out STD_LOGIC;
               Ts: out std_logic );
    end component ;
    
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
               reset: out std_logic );
    end component;
    
    --sinais
    signal sTs, sTl,clk5,clk25, sRst: std_logic ;
begin
    Clock_curto: Clock_5s port map (CLK_in => Clk, Rst => sRst, CLK_out =>clk5, Ts => sTs);
    Clock_longo: Clock_25s port map (CLK_in => Clk, Rst => sRst, CLK_out =>clk25, Tl => sTl);
    MaquinaEstados: Maquina_de_Estados port map(CLK => clk, tl => sTl, ts => sTs, vS => Vs, 
                                                    Mg => Mg, My => My, Mr => Mr, 
                                                    Sg => Sg, Sy => sy, Sr => Sr, reset => sRst);
    Clk_out <= Clk5;
end Behavioral;
