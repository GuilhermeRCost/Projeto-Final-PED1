----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2022 06:21:41
-- Design Name: 
-- Module Name: ShortTime_tb - Behavioral
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

entity ShortTime_tb is
--  Port ( );
end ShortTime_tb;

architecture Behavioral of ShortTime_tb is
    component  Clock_5s
         Port ( CLK_in : in STD_LOGIC;
               Rst: in std_logic ;
              CLK_out : out STD_LOGIC;
              Ts: out std_logic );
    end component;
    signal sclkin, sclkout, srst, sts: std_logic ;
begin
    utt: Clock_5s port map(clk_in =>sclkin, rst => srst, clk_out => sclkout, ts => sts);
    
    estimulo: process
    begin
        sclkin <= '0'; srst <='0'; wait for 1ns;
        sclkin <= '1'; wait for 0.5ns;
        srst <= '1'; wait for 0.5ns;
    end process;
end Behavioral;
