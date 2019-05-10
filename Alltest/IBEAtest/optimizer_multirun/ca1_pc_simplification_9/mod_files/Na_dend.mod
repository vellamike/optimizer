COMMENT

   **************************************************
   File generated by: neuroConstruct v1.5.1 
   **************************************************

   This file holds the implementation in NEURON of the Cell Mechanism:
   Na_dend (Type: Channel mechanism, Model: ChannelML based process)

   with parameters: 
   /channelml/@units = SI Units 
   /channelml/notes = ChannelML file containing a single Channel description 
   /channelml/channel_type/@name = Na_dend 
   /channelml/channel_type/status/@value = stable 
   /channelml/channel_type/status/comment = Equations adapted from Szabolcs Kali 
   /channelml/channel_type/status/contributor/name = Szoke Boglarka 
   /channelml/channel_type/notes = Na channel in dendrit of CA1 pyramid cell 
   /channelml/channel_type/authorList/modelTranslator/name = Szoke Boglarka 
   /channelml/channel_type/authorList/modelTranslator/institution = PPKE-ITK 
   /channelml/channel_type/authorList/modelTranslator/email = szoboce - at - digitus.itk.ppke.hu 
   /channelml/channel_type/parameters/parameter[1]/@name = dv0 
   /channelml/channel_type/parameters/parameter[1]/@value = -0.036 
   /channelml/channel_type/parameters/parameter[2]/@name = dk0 
   /channelml/channel_type/parameters/parameter[2]/@value = -0.003 
   /channelml/channel_type/parameters/parameter[3]/@name = dkt 
   /channelml/channel_type/parameters/parameter[3]/@value = 1000 
   /channelml/channel_type/parameters/parameter[4]/@name = dgamma 
   /channelml/channel_type/parameters/parameter[4]/@value = 0.9 
   /channelml/channel_type/parameters/parameter[5]/@name = dtau0 
   /channelml/channel_type/parameters/parameter[5]/@value = 0.0002 
   /channelml/channel_type/current_voltage_relation/@cond_law = ohmic 
   /channelml/channel_type/current_voltage_relation/@ion = na 
   /channelml/channel_type/current_voltage_relation/@default_gmax = 50 
   /channelml/channel_type/current_voltage_relation/@default_erev = 0.055 
   /channelml/channel_type/current_voltage_relation/gate[1]/@name = X 
   /channelml/channel_type/current_voltage_relation/gate[1]/@instances = 3 
   /channelml/channel_type/current_voltage_relation/gate[1]/closed_state/@id = X0 
   /channelml/channel_type/current_voltage_relation/gate[1]/open_state/@id = X 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[1]/@name = alpha 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[1]/@from = X0 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[1]/@to = X 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[1]/@expr_form = exponential 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[1]/@rate = 20000 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[1]/@scale = 0.01 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[1]/@midpoint = -0.031 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[2]/@name = beta 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[2]/@from = n 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[2]/@to = n0 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[2]/@expr_form = exponential 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[2]/@rate = 20000 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[2]/@scale = -0.00818182 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[2]/@midpoint = -0.031 
   /channelml/channel_type/current_voltage_relation/gate[2]/@name = Y 
   /channelml/channel_type/current_voltage_relation/gate[2]/@instances = 1 
   /channelml/channel_type/current_voltage_relation/gate[2]/closed_state/@id = Y0 
   /channelml/channel_type/current_voltage_relation/gate[2]/open_state/@id = Y 
   /channelml/channel_type/current_voltage_relation/gate[2]/time_course/@name = tau 
   /channelml/channel_type/current_voltage_relation/gate[2]/time_course/@from = Y0 
   /channelml/channel_type/current_voltage_relation/gate[2]/time_course/@to = Y 
   /channelml/channel_type/current_voltage_relation/gate[2]/time_course/@expr_form = generic 
   /channelml/channel_type/current_voltage_relation/gate[2]/time_course/@expr = ( 1 / ( (dkt * (exp (dgamma * (v - (dv0)) / (dk0)))) + (dkt * (exp ((dgamma - 1)  * (v - (dv0)) / (dk0))))) ) + dtau0 
   /channelml/channel_type/current_voltage_relation/gate[2]/steady_state/@name = inf 
   /channelml/channel_type/current_voltage_relation/gate[2]/steady_state/@from = Y 
   /channelml/channel_type/current_voltage_relation/gate[2]/steady_state/@to = Y0 
   /channelml/channel_type/current_voltage_relation/gate[2]/steady_state/@expr_form = generic 
   /channelml/channel_type/current_voltage_relation/gate[2]/steady_state/@expr = ((dkt * (exp (dgamma * (v - (dv0)) / (dk0)))) / ( (dkt * (exp (dgamma * (v - (dv0)) / (dk0)))) + (dkt * (exp ((dgamma - 1)  * (v - (dv0)) / (dk0)))))  ... 
   /channelml/channel_type/current_voltage_relation/gate[3]/@name = Z 
   /channelml/channel_type/current_voltage_relation/gate[3]/@instances = 1 
   /channelml/channel_type/current_voltage_relation/gate[3]/closed_state/@id = Z0 
   /channelml/channel_type/current_voltage_relation/gate[3]/open_state/@id = Z 
   /channelml/channel_type/current_voltage_relation/gate[3]/transition[1]/@name = alpha 
   /channelml/channel_type/current_voltage_relation/gate[3]/transition[1]/@from = Z0 
   /channelml/channel_type/current_voltage_relation/gate[3]/transition[1]/@to = Z 
   /channelml/channel_type/current_voltage_relation/gate[3]/transition[1]/@expr_form = generic 
   /channelml/channel_type/current_voltage_relation/gate[3]/transition[1]/@expr = ((1 + (0.35*(exp ((v + 0.058)/0.002))))/(1+(exp ((v + 0.058)/0.002))))*((1 + (exp (450*(v + 0.06))))/(5*(exp (90*(v + 0.06))) + 4*(exp (450*(v + 0.045 ... 
   /channelml/channel_type/current_voltage_relation/gate[3]/transition[2]/@name = beta 
   /channelml/channel_type/current_voltage_relation/gate[3]/transition[2]/@from = Z 
   /channelml/channel_type/current_voltage_relation/gate[3]/transition[2]/@to = Z0 
   /channelml/channel_type/current_voltage_relation/gate[3]/transition[2]/@expr_form = generic 
   /channelml/channel_type/current_voltage_relation/gate[3]/transition[2]/@expr = (1+(exp (450*(v + 0.06))))/(5*(exp (90*(v + 0.06))) + 4*(exp (450*(v + 0.045)))) - ((1 + (0.35*(exp ((v + 0.058)/0.002))))/(1+(exp ((v + 0.058)/0.002) ... 
   /channelml/channel_type/impl_prefs/table_settings/@max_v = 0.05 
   /channelml/channel_type/impl_prefs/table_settings/@min_v = -0.1 
   /channelml/channel_type/impl_prefs/table_settings/@table_divisions = 3000 

// File from which this was generated: /home/kali/nC_projects/CA1_NEURON/cellMechanisms/Na_dend/Na_dend.xml

// XSL file with mapping to simulator: /home/kali/nC_projects/CA1_NEURON/cellMechanisms/Na_dend/ChannelML_v1.8.1_NEURONmod.xsl

ENDCOMMENT


?  This is a NEURON mod file generated from a ChannelML file

?  Unit system of original ChannelML file: SI Units

COMMENT
    ChannelML file containing a single Channel description
ENDCOMMENT

TITLE Channel: Na_dend

COMMENT
    Na channel in dendrit of CA1 pyramid cell
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
      

    SUFFIX Na_dend
    USEION na READ ena WRITE ina VALENCE 1  ? reversal potential of ion is read, outgoing current is written
           
        
    RANGE gmax, gion
    
    RANGE Xinf, Xtau
    
    RANGE Yinf, Ytau
    
    RANGE Zinf, Ztau
    
    RANGE dv0
    RANGE dk0
    RANGE dkt
    RANGE dgamma
    RANGE dtau0
}

PARAMETER { 
      

    gmax = 0.0050 (S/cm2)  ? default value, should be overwritten when conductance placed on cell
    
    dv0 = -0.036 : Note units of this will be determined by its usage in the generic functions

    dk0 = -0.003 : Note units of this will be determined by its usage in the generic functions

    dkt = 1000 : Note units of this will be determined by its usage in the generic functions

    dgamma = 0.9 : Note units of this will be determined by its usage in the generic functions

    dtau0 = 0.0002 : Note units of this will be determined by its usage in the generic functions

}



ASSIGNED {
      

    v (mV)
    
    celsius (degC)
          

    ? Reversal potential of na
    ena (mV)
    ? The outward flow of ion: na calculated by rate equations...
    ina (mA/cm2)
    
    
    gion (S/cm2)
    Xinf
    Xtau (ms)
    Yinf
    Ytau (ms)
    Zinf
    Ztau (ms)
    
}

BREAKPOINT { 
                        
    SOLVE states METHOD cnexp
         

    gion = gmax*((X)^3)*((Y)^1)*((Z)^1)      

    ina = gion*(v - ena)
            

}



INITIAL {
    
    ena = 55
        
    rates(v)
    X = Xinf
        Y = Yinf
        Z = Zinf
        
    
}
    
STATE {
    X
    Y
    Z
    
}

DERIVATIVE states {
    rates(v)
    X' = (Xinf - X)/Xtau
    Y' = (Yinf - Y)/Ytau
    Z' = (Zinf - Z)/Ztau
    
}

PROCEDURE rates(v(mV)) {  
    
    ? Note: not all of these may be used, depending on the form of rate equations
    LOCAL  alpha, beta, tau, inf, gamma, zeta, temp_adj_X, A_alpha_X, B_alpha_X, Vhalf_alpha_X, A_beta_X, B_beta_X, Vhalf_beta_X, temp_adj_Y, A_tau_Y, B_tau_Y, Vhalf_tau_Y, A_inf_Y, B_inf_Y, Vhalf_inf_Y, temp_adj_Z, A_alpha_Z, B_alpha_Z, Vhalf_alpha_Z, A_beta_Z, B_beta_Z, Vhalf_beta_Z
        
    TABLE Xinf, Xtau,Yinf, Ytau,Zinf, Ztau
 DEPEND celsius, dv0, dk0, dkt, dgamma, dtau0
 FROM -100 TO 50 WITH 3000
    
    
    UNITSOFF
    temp_adj_X = 1
    temp_adj_Y = 1
    temp_adj_Z = 1
    
            
                
           

        
    ?      ***  Adding rate equations for gate: X  ***
        
    ? Found a parameterised form of rate equation for alpha, using expression: A*exp((v-Vhalf)/B)
    A_alpha_X = 20000
    B_alpha_X = 0.01
    Vhalf_alpha_X = -0.031   
    
    ? Unit system in ChannelML file is SI units, therefore need to convert these to NEURON quanities...
    
    A_alpha_X = A_alpha_X * 0.0010   ? 1/ms
    B_alpha_X = B_alpha_X * 1000   ? mV
    Vhalf_alpha_X = Vhalf_alpha_X * 1000   ? mV
          
                     
    alpha = A_alpha_X * exp((v - Vhalf_alpha_X) / B_alpha_X)
    
    
    ? Found a parameterised form of rate equation for beta, using expression: A*exp((v-Vhalf)/B)
    A_beta_X = 20000
    B_beta_X = -0.00818182
    Vhalf_beta_X = -0.031   
    
    ? Unit system in ChannelML file is SI units, therefore need to convert these to NEURON quanities...
    
    A_beta_X = A_beta_X * 0.0010   ? 1/ms
    B_beta_X = B_beta_X * 1000   ? mV
    Vhalf_beta_X = Vhalf_beta_X * 1000   ? mV
          
                     
    beta = A_beta_X * exp((v - Vhalf_beta_X) / B_beta_X)
    
    Xtau = 1/(temp_adj_X*(alpha + beta))
    Xinf = alpha/(alpha + beta)
          
       
    
    ?     *** Finished rate equations for gate: X ***
    

    
            
                
           

        
    ?      ***  Adding rate equations for gate: Y  ***
         
    ? Found a generic form of the rate equation for tau, using expression: ( 1 / ( (dkt * (exp (dgamma * (v - (dv0)) / (dk0)))) + (dkt * (exp ((dgamma - 1)  * (v - (dv0)) / (dk0))))) ) + dtau0
    
    ? Note: Equation (and all ChannelML file values) in SI Units so need to convert v first...
    
    v = v * 0.0010   ? temporarily set v to units of equation...
            
    tau = ( 1 / ( (dkt * (exp (dgamma * (v - (dv0)) / (dk0)))) + (dkt * (exp ((dgamma - 1)  * (v - (dv0)) / (dk0))))) ) + dtau0
        
    ? Set correct units of tau for NEURON
    tau = tau * 1000 
    
    v = v * 1000   ? reset v
        
    Ytau = tau/temp_adj_Y
     
    ? Found a generic form of the rate equation for inf, using expression: ((dkt * (exp (dgamma * (v - (dv0)) / (dk0)))) / ( (dkt * (exp (dgamma * (v - (dv0)) / (dk0)))) + (dkt * (exp ((dgamma - 1)  * (v - (dv0)) / (dk0))))) )
    
    ? Note: Equation (and all ChannelML file values) in SI Units so need to convert v first...
    
    v = v * 0.0010   ? temporarily set v to units of equation...
            
    inf = ((dkt * (exp (dgamma * (v - (dv0)) / (dk0)))) / ( (dkt * (exp (dgamma * (v - (dv0)) / (dk0)))) + (dkt * (exp ((dgamma - 1)  * (v - (dv0)) / (dk0))))) )
         
    
    v = v * 1000   ? reset v
        
    Yinf = inf
          
       
    
    ?     *** Finished rate equations for gate: Y ***
    

    
            
                
           

        
    ?      ***  Adding rate equations for gate: Z  ***
         
    ? Found a generic form of the rate equation for alpha, using expression: ((1 + (0.35*(exp ((v + 0.058)/0.002))))/(1+(exp ((v + 0.058)/0.002))))*((1 + (exp (450*(v + 0.06))))/(5*(exp (90*(v + 0.06))) + 4*(exp (450*(v + 0.045)))))
    
    ? Note: Equation (and all ChannelML file values) in SI Units so need to convert v first...
    
    v = v * 0.0010   ? temporarily set v to units of equation...
            
    alpha = ((1 + (0.35*(exp ((v + 0.058)/0.002))))/(1+(exp ((v + 0.058)/0.002))))*((1 + (exp (450*(v + 0.06))))/(5*(exp (90*(v + 0.06))) + 4*(exp (450*(v + 0.045)))))
        
    ? Set correct units of alpha for NEURON
    alpha = alpha * 0.0010 
    
    v = v * 1000   ? reset v
        
     
    ? Found a generic form of the rate equation for beta, using expression: (1+(exp (450*(v + 0.06))))/(5*(exp (90*(v + 0.06))) + 4*(exp (450*(v + 0.045)))) - ((1 + (0.35*(exp ((v + 0.058)/0.002))))/(1+(exp ((v + 0.058)/0.002))))*((1 + (exp (450*(v + 0.06))))/(5*(exp (90*(v + 0.06))) + 4*(exp (450*(v + 0.045)))))
    
    ? Note: Equation (and all ChannelML file values) in SI Units so need to convert v first...
    
    v = v * 0.0010   ? temporarily set v to units of equation...
            
    beta = (1+(exp (450*(v + 0.06))))/(5*(exp (90*(v + 0.06))) + 4*(exp (450*(v + 0.045)))) - ((1 + (0.35*(exp ((v + 0.058)/0.002))))/(1+(exp ((v + 0.058)/0.002))))*((1 + (exp (450*(v + 0.06))))/(5*(exp (90*(v + 0.06))) + 4*(exp (450*(v + 0.045)))))
        
    ? Set correct units of beta for NEURON
    beta = beta * 0.0010 
    
    v = v * 1000   ? reset v
        
    Ztau = 1/(temp_adj_Z*(alpha + beta))
    Zinf = alpha/(alpha + beta)
          
       
    
    ?     *** Finished rate equations for gate: Z ***
    

         

}


UNITSON


