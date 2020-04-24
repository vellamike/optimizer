COMMENT

   **************************************************
   File generated by: neuroConstruct v1.5.1 
   **************************************************



ENDCOMMENT


?  This is a NEURON mod file generated from a ChannelML file

?  Unit system of original ChannelML file: SI Units

COMMENT
    ChannelML file containing a single Channel description
ENDCOMMENT

TITLE Channel: CaN

COMMENT
    High-threshold Ca(N) Channel in pyramid neurons
ENDCOMMENT


UNITS {
    (mA) = (milliamp)
    (mV) = (millivolt)
    (S) = (siemens)
    (um) = (micrometer)
    (molar) = (1/liter)
    (mM) = (millimolar)
    (l) = (liter)
}


    
NEURON {
      

    SUFFIX CaN_BG_pool
    USEION can WRITE ican VALENCE 2 ?  outgoing current is written
           
        
    RANGE gmax, gion
    
    RANGE Xinf, Xtau
    
    RANGE Yinf, Ytau
	
	RANGE X_v0, X_k0, X_kt, X_gamma, X_tau0
    RANGE Y_v0, Y_k0, Y_kt, Y_gamma, Y_tau0
    
}

PARAMETER { 
      

    gmax = 0.0020 (S/cm2)  ? default value, should be overwritten when conductance placed on cell
    
	X_v0 = -4.5 : Note units of this will be determined by its usage in the generic functions (mV)

    X_k0 = 6 : Note units of this will be determined by its usage in the generic functions (mV)

    X_kt = 5 : Note units of this will be determined by its usage in the generic functions (1/ms)

    X_gamma = 0.2 : Note units of this will be determined by its usage in the generic functions

    X_tau0 = 0 : Note units of this will be determined by its usage in the generic functions (ms)
    
    Y_v0 = -75 : Note units of this will be determined by its usage in the generic functions (mV)

    Y_k0 = -6.5 : Note units of this will be determined by its usage in the generic functions (mV)

    Y_kt = 1: Note units of this will be determined by its usage in the generic functions (1/ms)

    Y_gamma = 0.5 : Note units of this will be determined by its usage in the generic functions

    Y_tau0 = 100 : Note units of this will be determined by its usage in the generic functions (ms)
	
}



ASSIGNED {
      

    v (mV)
    
    celsius (degC)
          

    ? Reversal potential of ca
    eca (mV)
    ? The outward flow of ion: ca calculated by rate equations...
    ican (mA/cm2)
    
    
    gion (S/cm2)
    Xinf
    Xtau (ms)
    Yinf
    Ytau (ms)
    
}

BREAKPOINT { 
                        
    SOLVE states METHOD cnexp
         

    gion = gmax*((X)^2)*((Y)^1)      

    ican = gion*(v - eca)
            

}



INITIAL {
    
    eca = 80
        
    rates(v)
    X = Xinf
        Y = Yinf
        
    
}
    
STATE {
    X
    Y
    
}

DERIVATIVE states {
    rates(v)
    X' = (Xinf - X)/Xtau
    Y' = (Yinf - Y)/Ytau
    
}

PROCEDURE rates(v(mV)) {  
    
    ? Note: not all of these may be used, depending on the form of rate equations
	LOCAL tau, inf, temp_adj_X, temp_adj_Y
        
    TABLE Xinf, Xtau,Yinf, Ytau
    DEPEND celsius, X_v0, X_k0, X_kt, X_gamma, X_tau0, Y_v0, Y_k0, Y_kt, Y_gamma, Y_tau0
    FROM -100 TO 50 WITH 3000
    
    
    UNITSOFF

    temp_adj_X = 1
    temp_adj_Y = 1

        
   ?      ***  Adding rate equations for gate: X  ***
            
    tau = 1 / ( (X_kt * (exp (X_gamma * (v - X_v0) / X_k0))) + (X_kt * (exp ((X_gamma - 1)  * (v - X_v0) / X_k0)))) + X_tau0
        
    Xtau = tau/temp_adj_X
    
    
    inf = 1 / ( 1 + exp (-(v - X_v0) / X_k0)) 
        
    Xinf = inf
    
    ?     *** Finished rate equations for gate: X ***
    
    
    ?      ***  Adding rate equations for gate: Y  ***
    
    tau = 1 / ( (Y_kt * (exp (Y_gamma * (v - Y_v0) / Y_k0))) + (Y_kt * (exp ((Y_gamma - 1)  * (v - Y_v0) / Y_k0)))) + Y_tau0
    
    ? Ytau = tau/temp_adj_Y
    
	Ytau=Y_tau0/temp_adj_Y
    
    inf = 1 / ( 1 + exp (-(v - Y_v0) / Y_k0)) 
    
    Yinf = inf
    
    ?     *** Finished rate equations for gate: Y ***

         

}


UNITSON


