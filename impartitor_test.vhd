LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY impartitor_test IS
GENERIC (per : time := 20 ns);
END impartitor_test;

ARCHITECTURE impartitor_test OF impartitor_test IS
COMPONENT impartitor
  PORT ( 
        start: IN std_logic;                                           -- semnal pentru startul operatiei de împărțire
        ck: IN std_logic;                                              -- semnal de ceas
        reset_n: IN std_logic;                                         -- reset asincron, activ în 0
        op1: IN std_logic_vector   (7 DOWNTO 0);                       -- primul operand
        op2: IN std_logic_vector   (7 DOWNTO 0);                       -- al doilea operand
 
        cat: OUT std_logic_vector  (7 DOWNTO 0);
        rest: OUT std_logic_vector (8 DOWNTO 0);                       -- rezultat
        valid: OUT std_logic    
  );
END COMPONENT;

  SIGNAL clk     : std_logic := '1';
  SIGNAL reset   : std_logic;
  SIGNAL start   : std_logic;

  SIGNAL op1      : std_logic_vector(7 DOWNTO 0);
  SIGNAL op2      : std_logic_vector(7 DOWNTO 0);

  SIGNAL cat      : std_logic_vector(7 DOWNTO 0);
  SIGNAL rest      : std_logic_vector(8 DOWNTO 0);
  SIGNAL ready  : std_logic;

  
BEGIN
  clk <= NOT clk AFTER per/2;
  reset <= '1', '0' AFTER 2*per;
  start <= '0', '1' AFTER 3*per, '0' AFTER 5*per;
  op1 <= "00000111";
  op2 <= "00000010";

  dut: impartitor
  PORT MAP( 
        ck         => clk, 
        reset_n       => reset, 

        op1           => op1,  
        op2           => op2,  

        start       => start,

        cat           => cat,  
        rest          => rest, 
        valid       => ready
   ); 
    
END impartitor_test;
