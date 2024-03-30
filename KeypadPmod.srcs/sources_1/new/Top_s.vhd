----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2024 01:40:40 PM
-- Design Name: 
-- Module Name: Top_s - Structural
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

entity Top_s is
    port (  clk : in std_logic;
            kypdRow : in std_logic_vector(3 downto 0); 
            kypdCol : out std_logic_vector(3 downto 0); 
            anOut : out std_logic_vector(3 downto 0);
            sevSegOut : out std_logic_vector(6 downto 0) 
    );
end Top_s;

architecture Structural of Top_s is

    -- Components --
component keypadDecoder_s is
    port(   clk : in std_logic;
            kypdRow : in std_logic_vector(3 downto 0); 
            kypdCol : out std_logic_vector(3 downto 0); 
            digit : out std_logic_vector(3 downto 0)
    );
end component; 

component sevSegDisp_s is
    port(   digit_in : in std_logic_vector(3 downto 0); 
            disp_out : out std_logic_vector(6 downto 0)
    );
end component;  

    -- Signals -- 
signal digit_t : std_logic_vector(3 downto 0) := (others => '1'); 
signal kypdRow_t : std_logic_vector(3 downto 0) := (others => '0'); 
signal kypdCol_t : std_logic_vector(3 downto 0) := (others => '0'); 
signal sevSegOut_t : std_logic_vector(6 downto 0) := (others => '0');  


begin
    -- IN to signal assignment --
    kypdRow_t <= kypdRow; 
  

    kypdDec0 : keypadDecoder_s 
    port map(
        clk => clk, 
        kypdRow => kypdRow_t, 
        kypdCol => kypdCol_t, 
        digit => digit_t
    );

    ssd0 : sevSegDisp_s
    port map(
        digit_in => digit_t, 
        disp_out => sevSegOut_t
    ); 


    -- signal to OUT assignment -- 
    sevSegOut <= sevSegOut_t; 
    kypdCol <= kypdCol_t;
    anOut <= "1101"; 
    


end Structural;
