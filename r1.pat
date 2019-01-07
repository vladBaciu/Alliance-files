
-- description generated by Pat driver

--			date     : Mon Jan  7 20:51:57 2019
--			revision : v109

--			sequence : divider

-- input / output list :
in       op1 (7 downto 0) B;;;
in       op2 (7 downto 0) B;;;
in       ck B;;;
in       reset_n B;;;
in       start B;;;
in       vdd B;
in       vss B;;;
out      valid B;;;
out      cat (7 downto 0) B;;
out      rest (8 downto 0) B;;

begin

-- Pattern description :

--                                 o         o         c  r  s  vv   v   c         r          
--                                 p         p         k  e  t  ds   a   a         e          
--                                 1         2            s  a  ds   l   t         s          
--                                                        e  r       i             t          
--                                                        t  t       d                        
--                                                        _                                   
--                                                        n                                   

pat_0                            : 00000111  00000010  1  1  0  10  ?u  ?uuuuuuuu ?uuuuuuuuu ;
pat_1                            : 00000111  00000010  0  1  0  10  ?u  ?uuuuuuuu ?uuuuuuuuu ;
pat_2                            : 00000111  00000010  1  1  0  10  ?0  ?uuuuuuuu ?uuuuuuuuu ;
pat_3                            : 00000111  00000010  0  1  0  10  ?0  ?uuuuuuuu ?uuuuuuuuu ;
pat_4                            : 00000111  00000010  1  0  1  10  ?0  ?uuuuuuuu ?uuuuuuuuu ;
pat_5                            : 00000111  00000010  0  0  1  10  ?0  ?uuuuuuuu ?uuuuuuuuu ;
pat_6                            : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_7                            : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_8                            : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_9                            : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_10                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_11                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_13                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_14                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_15                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_16                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_17                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_18                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_19                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_20                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_21                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_22                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_23                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_24                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_25                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_26                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_27                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_28                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_29                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_30                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_31                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_32                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_33                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_34                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_35                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_36                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_37                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_38                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_39                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_40                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_41                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_42                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_43                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_44                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_45                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_46                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_47                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_48                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_49                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_50                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_51                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_52                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_53                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_54                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_55                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_56                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_57                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_58                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_59                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_60                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_61                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_62                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_63                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_63                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_64                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_65                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_66                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_67                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_68                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_69                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_70                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_71                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_72                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_73                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_74                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_75                           : 00000111  00000010  0  0  0  10  ?0  ?00000000 ?000000000 ;
pat_76                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_77                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_78                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_79                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_80                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;
pat_81                           : 00000111  00000010  1  0  0  10  ?0  ?00000000 ?000000000 ;

end;