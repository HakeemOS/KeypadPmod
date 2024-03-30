----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2024 01:40:40 PM
-- Design Name: 
-- Module Name: sevSegDisp_s - Behavioral
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

entity sevSegDisp_s is
    port (  digit_in : in std_logic_vector(3 downto 0); 
            disp_out : out std_logic_vector(6 downto 0)
    );
end sevSegDisp_s;

architecture Behavioral of sevSegDisp_s is

    -- Signals 
signal disp_t : std_logic_vector(6 downto 0) := "1000000"; 

begin
    proc1 : process( digit_in )
    begin
        case( digit_in ) is
            when x"0" => disp_t <= "1000000"; 
            when x"1" => disp_t <= "1111001";
            when x"2" => disp_t <= "0100100"; 
            when x"3" => disp_t <= "0110000"; 
            when x"4" => disp_t <= "0011001"; 
            when x"5" => disp_t <= "0010010"; 
            when x"6" => disp_t <= "0000010"; 
            when x"7" => disp_t <= "1111000"; 
            when x"8" => disp_t <= "0000000"; 
            when x"9" => disp_t <= "0010000"; 
            when x"a" => disp_t <= "0001000"; 
            when x"b" => disp_t <= "0000011"; 
            when x"c" => disp_t <= "1000110"; 
            when x"d" => disp_t <= "0100001"; 
            when x"e" => disp_t <= "0000110"; 
            when x"f" => disp_t <= "0001110";
            when others => null; 
        end case ;
    end process ; -- proc1

    disp_out <= disp_t; 

end Behavioral;
