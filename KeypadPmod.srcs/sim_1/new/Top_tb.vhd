----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2024 03:03:09 PM
-- Design Name: 
-- Module Name: Top_tb - Behavioral
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

entity Top_tb is
--  Port ( );
end Top_tb;

architecture Behavioral of Top_tb is

    -- UUT/DUT --
component Top_s is
    port(   clk : in std_logic;
            kypdRow : in std_logic_vector(3 downto 0); 
            kypdCol : out std_logic_vector(3 downto 0); 
            anOut : out std_logic_vector(3 downto 0); 
            sevSegOut : out std_logic_vector(6 downto 0)
    );
end component; 

    -- Signals --
signal clk : std_logic; 
signal kypdRow, kypdCol, anOut : std_logic_vector(3 downto 0); 
signal sevSegOut : std_logic_vector(6 downto 0); 
    -- clk Signals --
signal clk_period : time := 10ns; 
signal clk_stop : boolean; 


begin

    clkproc : process 
    begin
        clk <= '1';
        wait for clk_period/2; 
        clk <= '0'; 
        wait for clk_period/2; 
    end process ; -- clkproc

    dut : Top_s
    port map(   
        clk => clk, 
        kypdRow => kypdRow, 
        kypdCol => kypdCol, 
        anOut => anOut, 
        sevSegOut => sevSegOut
    ); 

    stim : process
    begin
       
        kypdRow <= "1101"; 

        wait for 10ns; 

        kypdRow <= "1110"; 

        wait for 10ns; 

        kypdRow <= "1011"; 

        wait for 1ms;

        kypdRow <= "1110"; 

        wait; 
        
        
    end process ; -- stim

end Behavioral;
