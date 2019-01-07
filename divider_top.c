#include <genlib.h>  
  
main()  
{  
int i;  
  
   GENLIB_DEF_LOFIG("divider_top");  
  
   GENLIB_LOCON("vdd",           IN,        "vdd");    
   GENLIB_LOCON("vss",           IN,        "vss");    
   GENLIB_LOCON("vdde",          IN,       "vdde");   
   GENLIB_LOCON("vsse",          IN,       "vsse");   
   GENLIB_LOCON("ck",            IN,         "ck"); 
   GENLIB_LOCON("reset_n",         IN,      "reset_n");     
   GENLIB_LOCON("op1[7:0]",        IN,     "op1[7:0]");    
   GENLIB_LOCON("op2[7:0]",        IN,     "op2[7:0]");  
   GENLIB_LOCON("start",         IN,      "start");  
   GENLIB_LOCON("valid",        OUT,      "valid");    
   GENLIB_LOCON("cat[7:0]",    OUT,  "cat[7:0]");    
   GENLIB_LOCON("rest[8:0]",    OUT,  "rest[8:0]");      
                              
   GENLIB_LOINS ("pvsse_sp", "p33", "cki", "vdde", "vdd", "vsse", "vss", 0);  
   GENLIB_LOINS ("pvdde_sp", "p34", "cki", "vdde", "vdd", "vsse", "vss", 0);  
   GENLIB_LOINS ("pvddeck_sp", "p35", "clock", "cki", "vdde", "vdd", "vsse", "vss",0); 
   GENLIB_LOINS ("pvssi_sp", "p36", "cki", "vdde", "vdd", "vsse", "vss", 0);  
   GENLIB_LOINS ("pvddi_sp", "p37", "cki", "vdde", "vdd", "vsse", "vss", 0);  
  
   for (i = 0; i < 8; i++)  
    GENLIB_LOINS("pi_sp", GENLIB_NAME("p%d", i),   
          GENLIB_NAME("op1[%d]", i), GENLIB_NAME("op11[%d]", i),   
         "cki", "vdde", "vdd", "vsse", "vss", 0);  
  
   for (i = 0; i < 8; i++)  
    GENLIB_LOINS("pi_sp", GENLIB_NAME("p%d", i + 8),   
          GENLIB_NAME("op2[%d]", i), GENLIB_NAME("op22[%d]", i),   
         "cki", "vdde", "vdd", "vsse", "vss", 0);  
  //8 
   for (i = 0; i < 8; i++)  
    GENLIB_LOINS("po_sp", GENLIB_NAME("p%d", i + 16),   
          GENLIB_NAME("catcat[%d]", i), GENLIB_NAME("cat[%d]", i),  
         "cki", "vdde", "vdd", "vsse", "vss", 0);  
//7
   for (i = 0; i < 9; i++)  
    GENLIB_LOINS("po_sp", GENLIB_NAME("p%d", i + 24),   
          GENLIB_NAME("restrest[%d]", i), GENLIB_NAME("rest[%d]", i),  
         "cki", "vdde", "vdd", "vsse", "vss", 0);  
//8
  
  
   GENLIB_LOINS("pi_sp", "p38",  
         "start", "startstart",  
         "cki", "vdde", "vdd", "vsse", "vss", 0);  
     
   GENLIB_LOINS("pi_sp", "p39",  
         "reset_n", "resetreset",  
         "cki", "vdde", "vdd", "vsse", "vss", 0);  
     
   GENLIB_LOINS("pck_sp", "p40",  
         "ck",  
         "cki", "vdde", "vdd", "vsse", "vss", 0);  
     
   GENLIB_LOINS("po_sp", "p42",  
         "validvalid", "valid",  
         "cki", "vdde", "vdd", "vsse", "vss", 0);  
     
   GENLIB_LOINS("divider", "divider",
   	     	"clock", 
  	     	"op11[7:0]",
		"op22[7:0]",
 		"catcat[7:0]","restrest[8:0]", 
	        "startstart",
		"resetreset",
   	  	 "validvalid",
             "vdd", "vss", 0);  
  
   GENLIB_SAVE_LOFIG();  
   exit(0);   
}  
