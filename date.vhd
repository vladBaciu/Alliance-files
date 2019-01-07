LIBRARY IEEE;
use ieee.numeric_std.all;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY date IS
PORT ( 
  -- semnale provenite de la test
    CD_clk               : IN  std_logic;
    CD_reset             : IN  std_logic;
    CD_op1               : IN  std_logic_vector(7 DOWNTO 0); 
    CD_op2               : IN  std_logic_vector(7 DOWNTO 0); 

    -- semnale provenite de la CC
    CD_init              : IN  std_logic;
    CD_ld_op1            : IN  std_logic;
    CD_ld_op2            : IN  std_logic;
    CD_add_B_to_P        : IN  std_logic;
    CD_shift_left_P      : IN  std_logic;
    CD_subtract_from_P   : IN std_logic;
    CD_add_to_P1         : IN  std_logic;
    CD_shift_left_A1     : IN  std_logic;
    CD_add_to_P2         : IN  std_logic;
    CD_shift_left_A2     : IN  std_logic;
    CD_add_to_A          : IN  std_logic;
    CD_ld_r              : IN std_logic;

    -- feedback pt CC
    CD_n                 : OUT std_logic_vector(7 DOWNTO 0);
    CD_p                 : OUT std_logic_vector(8 DOWNTO 0);

  -- output cate test
    CD_cat                : OUT std_logic_vector(7 DOWNTO 0);
    CD_rest                : OUT std_logic_vector(8 DOWNTO 0)
);
END date;
ARCHITECTURE date OF date IS
  SIGNAL reg_A     : std_logic_vector(7 DOWNTO 0) := "00000000";
  SIGNAL reg_B     : std_logic_vector(7 DOWNTO 0) := "00000000";
  SIGNAL reg_B_Negat     : std_logic_vector(8 DOWNTO 0) := "000000000";
  SIGNAL reg_P     : std_logic_vector(8 DOWNTO 0) := "000000000";
  SIGNAL reg_N     : std_logic_vector(7 DOWNTO 0)  :="00000000";
BEGIN

-- reg_A - Deimpartit
PROCESS(CD_clk)
  BEGIN
    IF (CD_clk'EVENT AND CD_clk = '1') THEN
            IF (CD_reset = '1') THEN 
                        reg_A <= (others => '0');
            ELSIF (CD_init = '1') THEN
                        CD_cat <= (others => '0');
                        reg_A <= (others => '0');
            ELSIF (CD_ld_op1 = '1') THEN
                        reg_A <= CD_op1;
            ELSIF (CD_shift_left_A1 = '1') THEN
                        reg_A <= reg_A(6 DOWNTO 0) & reg_P(8);
            ELSIF (CD_shift_left_A2 = '1') THEN
                        reg_A <= reg_A(6 DOWNTO 0) & reg_P(8);
            ELSIF (CD_add_to_A = '1') THEN
                        reg_A <= reg_A + '1';
            ELSIF (CD_ld_r = '1') THEN
                        CD_CAT <= reg_A;
                        
            END IF;
    END IF;    
END PROCESS;

-- reg_B - Impartitor
PROCESS(CD_clk)
  BEGIN
      IF (CD_clk'EVENT AND CD_clk = '1') THEN
      IF (CD_reset = '1') THEN 
                reg_B <= (others => '0');
      ELSIF (CD_init = '1') THEN
                reg_B <= (others => '0');
      ELSIF (CD_ld_op1 = '1') THEN
                reg_B <= CD_op2;
                reg_B_Negat <= '1' &(not(CD_op2) + '1');
      END IF;
    END IF;    
END PROCESS;
-- n 
PROCESS(CD_clk)
  BEGIN
      IF (CD_clk'EVENT AND CD_clk = '1') THEN
      IF (CD_reset = '1') THEN 
                reg_N <= (others => '0');
                
      ELSIF (CD_init = '1') THEN
                reg_N <= "00000111";
      ELSIF (CD_shift_left_A1 = '1') THEN
                reg_N <= reg_N - '1' ;
      END IF;
    END IF;    
END PROCESS;
CD_n <= reg_N;
-- reg_P 
PROCESS(CD_clk)
  BEGIN
      IF (CD_clk'EVENT AND CD_clk = '1') THEN
      IF (CD_reset = '1') THEN 
                reg_P <= (others => '0');
      ELSIF (CD_init = '1') THEN
                reg_P <= (others => '0');
                CD_rest <= (others => '0');
      ELSIF (CD_ld_op1 = '1') THEN
                reg_P <= "000000000" ;
      ELSIF (CD_add_B_to_P = '1') THEN
                reg_P <=  '1' & (not(reg_B)+'1');
      ELSIF (CD_shift_left_P = '1') THEN
                reg_P <= reg_P(7 DOWNTO 0) & reg_A(7);
      ELSIF (CD_subtract_from_P = '1') THEN
                reg_P <= reg_P + reg_B_Negat;
      ELSIF (CD_add_to_P1 = '1') THEN
                reg_P <= reg_P + reg_B;
      ELSIF (CD_add_to_P2 = '1') THEN
                reg_P <= reg_P + reg_B;   
      ELSIF (CD_ld_r = '1') THEN
                CD_REST <= reg_P;
                       
      END IF;
    END IF;    
END PROCESS;
CD_p <= reg_P;

END date;