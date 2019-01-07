library IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- împărțirtor fara restaurare (impartitor negativ, deimpartit pozitiv) --
--  n=8 biti
--                  op1[n:0]    op2[n:0]
--                   ____|______|_____
--                  |                 |
--         start  __|    Impartitor   |
--                  |       fara      |__  valid
--            ck  __|    restaurare   |
--                  |                 |
--       reset_n  __|                 |
--                  |                 |
--                  |_________________|
--                          |
--                      result[n:0]


ENTITY impartitor IS 
PORT ( 

       ck: IN std_logic;                                              -- semnal de ceas
       reset_n: IN std_logic;                                         -- reset asincron, activ în 0
       op1: IN std_logic_vector   (7 DOWNTO 0);                       -- primul operand
       op2: IN std_logic_vector   (7 DOWNTO 0);                       -- al doilea operand

       cat: OUT std_logic_vector  (7 DOWNTO 0);
       rest: OUT std_logic_vector (8 DOWNTO 0);                       -- rezultat
       start: IN std_logic;                                           -- semnal pentru startul operatiei de împărțire
       valid: OUT std_logic                                           -- rezultat valid al operației de împărțire
       );                                          

END impartitor;

ARCHITECTURE impartitor OF impartitor is
    COMPONENT control 
    PORT(

        CC_clk     : IN  std_logic;
        CC_reset   : IN  std_logic;
        CC_start   : IN  std_logic;

        CC_p       : IN  std_logic_vector(8 DOWNTO 0);
        CC_n       : IN  std_logic_vector(7 DOWNTO 0);
        
        
        CC_init              : OUT  std_logic;
        CC_ld_op1            : OUT  std_logic;
        CC_ld_op2            : OUT  std_logic;
        CC_add_B_to_P        : OUT  std_logic;
        CC_shift_left_P      : OUT  std_logic;
        CC_subtract_from_P   : OUT std_logic;
        CC_add_to_P1         : OUT  std_logic;
        CC_shift_left_A1     : OUT  std_logic;
        CC_add_to_P2         : OUT  std_logic;
        CC_shift_left_A2     : OUT  std_logic;
        CC_add_to_A          : OUT  std_logic;
        CC_ld_r              : OUT std_logic;


        CC_ready             : OUT std_logic
    );
    END COMPONENT;

    COMPONENT date
    PORT ( 

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
        CD_CAT                 : OUT std_logic_vector(7 DOWNTO 0);
        CD_REST                : OUT std_logic_vector(8 DOWNTO 0)
);
  END COMPONENT;

SIGNAL p :  std_logic_vector(8 DOWNTO 0);
SIGNAL n :  std_logic_vector (7 DOWNTO 0);



SIGNAL init,ld_op1,ld_op2,add_B_to_P,shift_left_P,subtract_from_P : std_logic;
SIGNAL add_to_P1,shift_left_A1,add_to_P2,shift_left_A2,add_to_A,ld_r : std_logic;
BEGIN 
    i_date: date
    PORT MAP(
    CD_clk => ck,
    CD_reset => reset_n,

    CD_op1 => op1,
    CD_op2 => op2,

    CD_init   => init,
    CD_ld_op1 => ld_op1,
    CD_ld_op2 => ld_op2,
    CD_add_B_to_P => add_B_to_P,
    CD_shift_left_P => shift_left_P,
    CD_subtract_from_P => subtract_from_P,
    CD_add_to_P1 => add_to_P1,
    CD_shift_left_A1  => shift_left_A1,
    CD_add_to_P2 => add_to_P2,
    CD_shift_left_A2 => shift_left_A2,
    CD_add_to_A => add_to_A,
    CD_ld_r => ld_r,
  
    CD_n => n,
    CD_p => p,
    

    CD_cat => cat,
    CD_rest => rest
    );

    i_ctrl: control 
    PORT MAP(
        CC_clk     => ck,
        CC_reset   => reset_n,

        CC_start   => start,
        CC_P       => p,
        CC_n       => n,
        --FSM outputs
        CC_init              => init,
        CC_ld_op1            => ld_op1,
        CC_ld_op2            => ld_op2,
        CC_add_B_to_P        => add_B_to_P,
        CC_shift_left_P      => shift_left_P,
        CC_subtract_from_P   => subtract_from_P,
        CC_add_to_P1         => add_to_P1,
        CC_shift_left_A1     => shift_left_A1,
        CC_add_to_P2         => add_to_P2,
        CC_shift_left_A2     => shift_left_A2,
        CC_add_to_A          => add_to_A,
        CC_ld_r              => ld_r,

        CC_ready             => valid
    );


END impartitor;
