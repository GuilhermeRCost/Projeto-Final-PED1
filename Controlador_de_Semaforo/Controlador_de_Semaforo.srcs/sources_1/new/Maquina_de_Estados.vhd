----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.09.2022 14:05:56
-- Design Name: Guilherme Rodrigues , Pedro Lucas Garcia, Ana Beatriz Norberto
-- Module Name: Maquina_de_Estados - Behavioral
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

entity Maquina_de_Estados is
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
end Maquina_de_Estados;

architecture Behavioral of Maquina_de_Estados is
    type state is (e1, e2,e3, e4);
    signal sM, sS: std_logic_vector (0 to 2) ;
    signal cState, nextState: state := e1;
    
    
begin
    Mg <= sM(0);
    My <= sM(1);
    Mr <= sM(2);
    
    Sg <= sS(0);
    Sy <= sS(1);
    Sr <= sS(2);
    
    --atribuindo valor as saidas
      with cState  select
          sM <= "100" when e1,  --verde
                "010" when e2,  --amarelo
                "001" when e3,  --vermelho
                "001" when e4,  --vermelho
                "000" when others ; 
     with cState  select 
          sS <=  "001" when e1, --vermelho
                 "001" when e2, --vermelho
                 "100" when e3, --verde
                 "010" when e4, --amarelo
                 "000" when others;  --vermelho
    
    
    
 
    --transi??o de estados
        armazena_estado: process(clk, vS, cstate, nextState)
        begin
           
               if ( rising_edge(clk) ) then
                   cState <= nextState;
               end if;  
        end process;
        
         transicao_estado: process(cstate, Vs, tl)
              begin
                  case cstate is
                   when e1 => 
                      if (Tl ='1' and Vs ='0')   then --looping
                        reset <= '0';
                        nextState <= e1;
                      else  
                        reset <= '1';
                        nextState <= e2;
                      end if;
                   when e2 =>
                       if ts ='0' then
                             reset <='1';
                            nextState <= e3;
                       else  
                             reset <='0';
                            nextState <= e2;   
                       end if;
                        
                   when e3 =>
                   --Resetando o clock para os novos estados
                      if (Tl ='1' and Vs ='1')   then --looping
                       reset <= '0';
                       nextState <= e3;
                     else
                       reset <= '1';
                       nextState <= e4;
                     end if;
                   when e4 =>
                       if ts ='0' then
                           reset <= '1';
                           nextState <= e1;
                      else 
                           reset <= '0'; 
                           nextState <= e4;   
                      end if;  
                   end case;
              end process;
end Behavioral;
