LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
 
ENTITY control IS
PORT ( 
    CC_clk     : IN  std_logic;
    CC_reset   : IN  std_logic;
    --FSM inputs
    CC_start   : IN  std_logic;
    CC_p       : IN  std_logic_vector(8 DOWNTO 0);
    CC_n       : IN  std_logic_vector(7 DOWNTO 0);
    --FSM outputs
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
END control;
ARCHITECTURE control OF control IS

TYPE state IS (S0_INIT,S1_LOAD_OP,S2_CC_add_B_to_P,S3_SHIFT_P,S4_ADD_TO_P,S5_SUBTRACT_FROM_P,S6_SHIFT_A,
               S7_ADD_TO_P,S8_ADD_TO_A,S9_SHIFT_A,S10_READY,S11_DECISION,S12_DECISION2);
SIGNAL currentState: state;
SIGNAL nextState:    state;
SIGNAL ld_r_ready   : std_logic;

BEGIN

CLC: PROCESS (currentState, CC_start,CC_n,CC_p) BEGIN
  CASE currentState IS
    WHEN S0_INIT =>    IF ( CC_start   = '1' ) THEN
      	                 nextState <= S1_LOAD_OP;
                     ELSE 
      	                 nextState <= S0_INIT;
                    END IF; 
    WHEN S1_LOAD_OP =>      nextState <= S2_CC_add_B_to_P;
    WHEN S2_CC_add_B_to_P =>   nextState <= S11_DECISION;
    WHEN S11_DECISION =>   nextState <= S3_SHIFT_P;
    WHEN S3_SHIFT_P => IF (CC_p(8)='1') THEN
                         nextState <= S4_ADD_TO_P;  
                    ELSE
                         nextState <= S5_SUBTRACT_FROM_P; 
                    END IF;
    WHEN S4_ADD_TO_P          => nextState <= S6_SHIFT_A;
    WHEN S5_SUBTRACT_FROM_P   => nextState <= S6_SHIFT_A;
    WHEN S6_SHIFT_A => IF (CC_n = "00000000") THEN
                        nextState <= S12_DECISION2;
                        ELSE
                        nextState <= S11_DECISION; 
                    END IF;
    WHEN S12_DECISION2 =>   IF(CC_p(8)='1')  THEN
                                nextState <= S7_ADD_TO_P;  
                            ELSE
                                nextState <= S8_ADD_TO_A;
		            END IF;
    WHEN S7_ADD_TO_P    =>  nextState  <= S8_ADD_TO_A;
        
    WHEN S9_SHIFT_A     =>  nextState  <= S8_ADD_TO_A;
    WHEN S8_ADD_TO_A    =>  nextState  <= S10_READY;  
    WHEN S10_READY      =>  IF ( CC_start   = '1' ) THEN
                            nextState  <= S0_INIT;
                            else
                            nextState  <= S10_READY;
                            END IF;    
  END CASE;
END PROCESS CLC;

REG: PROCESS ( CC_clk  ) BEGIN
  IF (CC_clk'EVENT AND CC_clk = '1') THEN
    IF (CC_reset = '1') THEN
        currentState <= S0_INIT;
    ELSE
        currentState <= nextState;
    END IF;
  END IF;
END PROCESS REG;

--FSM outputs
    CC_init              <= '1' WHEN (currentState = S0_INIT ) ELSE '0';
    CC_ld_op1            <= '1' WHEN (currentState = S1_LOAD_OP) ELSE '0';
    CC_ld_op2            <= '1' WHEN (currentState = S1_LOAD_OP) ELSE '0';
    CC_add_B_to_P        <= '1' WHEN (currentState = S2_CC_add_B_to_P) ELSE '0';
    CC_shift_left_P      <= '1' WHEN (currentState = S3_SHIFT_P)  ELSE '0';
    CC_add_to_P1         <= '1' WHEN (currentState = S4_ADD_TO_P) ELSE '0';
    CC_subtract_from_P   <= '1' WHEN (currentState = S5_SUBTRACT_FROM_P) ELSE '0';
    CC_shift_left_A1     <= '1' WHEN (currentState = S6_SHIFT_A)   ELSE '0';
    CC_add_to_P2         <= '1' WHEN (currentState = S7_ADD_TO_P)  ELSE '0';
    CC_add_to_A          <= '1' WHEN (currentState = S8_ADD_TO_A)  ELSE '0';
    CC_shift_left_A2     <= '1' WHEN (currentState = S9_SHIFT_A)   ELSE '0';
    ld_r_ready           <= '1' WHEN (currentState = S10_READY)    ELSE '0';
    CC_ld_r <= ld_r_ready;   

PROCESS ( CC_clk ) BEGIN
    IF (CC_clk'EVENT AND CC_clk = '1') THEN
      IF (CC_reset = '1') THEN
          CC_ready <= '0';
      ELSE
          CC_ready <= ld_r_ready;
      END IF;
    END IF;
  END PROCESS;
    
END control;
