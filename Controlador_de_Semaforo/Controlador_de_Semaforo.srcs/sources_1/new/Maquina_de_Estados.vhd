----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.09.2022 14:05:56
-- Design Name: 
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
           Vs : in STD_LOGIC;
           TL : in STD_LOGIC;
           Ts : in STD_LOGIC;
           Mg : out STD_LOGIC;
           My : out STD_LOGIC;
           Mr : out STD_LOGIC;
           Sg : out STD_LOGIC;
           Sy : out STD_LOGIC;
           Sr : out STD_LOGIC);
end Maquina_de_Estados;

architecture Behavioral of Maquina_de_Estados is
    type state is (e1, e2,e3, e4);
    signal cState, nextState: state;
begin

    armazena_estado: process(clk)
    begin
        if (rising_edge(clk)) then
            cState <= nextState;
        end if;
    end process;
    
     transicao_estado: process(cstate, vs, tl, ts)
          begin
              case cstate is
               when e1 => 
                    if (VS ='1' and tl ='0') then
                        nextState <= e2;
                    else
                        nextState <= e1;    
                    end if; 
               when e2 =>
                    if ( ts ='0') then
                       nextState <= e3;
                   else
                       nextState <= e2;    
                   end if;
               when e3 =>
                    if (VS ='0' or tl ='0') then
                       nextState <= e4;
                    else
                       nextState <= e3;    
                    end if;
               when e4 =>
                    if (ts ='0') then
                       nextState <= e2;
                   else
                       nextState <= e1;    
                   end if;
              end case;
          end process;
end Behavioral;
