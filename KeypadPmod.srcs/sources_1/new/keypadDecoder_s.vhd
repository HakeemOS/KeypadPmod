----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2024 01:40:40 PM
-- Design Name: 
-- Module Name: keypadDecoder_s - Behavioral
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
use IEEE.NUMERIC_STD.ALL; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity keypadDecoder_s is
    port (  clk : in std_logic;
            kypdRow : in std_logic_vector(3 downto 0); 
            kypdCol : out std_logic_vector(3 downto 0); 
            digit : out std_logic_vector(3 downto 0) 
    );
end keypadDecoder_s;

architecture Behavioral of keypadDecoder_s is

    -- Signals --
signal colSelect : std_logic_vector(1 downto 0) := (others => '0'); 
signal counter : std_logic_vector(16 downto 0) := (others => '0'); 
signal digit_t : std_logic := '0'; 
signal kypdCol_t : std_logic_vector(3 downto 0) := (others => '0'); 
-- qTemp <= std_logic_vector (unsigned (a) + 1); 


begin
    counterProc : process( clk )                                            -- controls colSelect; increments every 1ms 
    begin
        if (counter = "11000011010011111") then
            colSelect <= std_logic_vector(unsigned(colSelect) + 1); 
            counter <= (others => '0'); 
        else
            counter <= std_logic_vector(unsigned(counter) + 1); 
        end if ;
    end process ; -- counterProc

    proc1 : process( clk )                                                  -- selects colomn based on colSelect; 100ns delay; if key pressed in selected column records row, determines digit and sets to value
    begin
        case( colSelect ) is
            when "00" =>
                kypdCol_t <= "0111"; 
                if (counter = "00000000000001010" ) then                    -- 100ns delay
                    case( kypdRow ) is
                        when "0111" => digit_t <= "0001";                   -- 1
                        when "1011" => digit_t <= "0100";                   -- 4
                        when "1101" => digit_t <= "0111";                   -- 7             
                        when "1110" => digit_t <= "0000";                   -- 0
                        when others => null;    
                    end case ;  
                end if ;    
            when "01" =>    
                kypdCol_t <= "1011";    
                if (counter = "00000000000001010" ) then    
                    case( kypdRow ) is  
                        when "0111" => digit_t <= "0010";                   -- 2
                        when "1011" => digit_t <= "0101";                   -- 5
                        when "1101" => digit_t <= "1000";                   -- 8
                        when "1110" => digit_t <= "1111";                   -- f
                        when others => null;    
                    end case ;  
                end if;                 
            when "10" =>    
                kypdCol_t <= "1101";    
                if (counter = "00000000000001010" ) then    
                    case( kypdRow ) is  
                        when "0111" => digit_t <= "0011";                   -- 3
                        when "1011" => digit_t <= "0110";                   -- 6
                        when "1101" => digit_t <= "1001";                   -- 9
                        when "1110" => digit_t <= "1110";                   -- e
                        when others => null; 
                    end case ; 
                end if;
            when others =>
                kypdCol_t <= "1101";
                if (counter = "00000000000001010" ) then
                    case( kypdRow ) is
                        when "0111" => digit_t <= "1010";               -- a
                        when "1011" => digit_t <= "1011";               -- b
                        when "1101" => digit_t <= "1100";               -- c
                        when "1110" => digit_t <= "1101";               -- d 
                        when others => null; 
                    end case ; 
                end if;
        end case ;
    end process ; -- proc1

    digit <= digit_t; 
    kypdCol <= kypdCol_t; 

end Behavioral;
