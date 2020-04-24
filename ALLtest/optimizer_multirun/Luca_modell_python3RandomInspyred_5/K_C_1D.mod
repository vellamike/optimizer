COMMENT

   **************************************************
   File generated by: neuroConstruct v1.5.1 
   **************************************************

   This file holds the implementation in NEURON of the Cell Mechanism:
   K_C_1D (Type: Channel mechanism, Model: ChannelML based process)

   with parameters: 
   /channelml/@units = SI Units 
   /channelml/channel_type/@name = K_C_1D 
   /channelml/channel_type/@density = yes 
   /channelml/channel_type/status/@value = stable 
   /channelml/channel_type/status/contributor/name = Boglarka Szoke 
   /channelml/channel_type/notes = Calcium dependent K channel in OLM interneuron 
   /channelml/channel_type/authorList/modelAuthor/name = Szabolcs Kali 
   /channelml/channel_type/authorList/modelTranslator/name = Boglarka Szoke 
   /channelml/channel_type/authorList/modelTranslator/institution = PPKE-ITK 
   /channelml/channel_type/authorList/modelTranslator/email = szoboce - at - digitus.itk.ppke.hu 
   /channelml/channel_type/current_voltage_relation/@cond_law = ohmic 
   /channelml/channel_type/current_voltage_relation/@ion = k 
   /channelml/channel_type/current_voltage_relation/@default_gmax = 20 
   /channelml/channel_type/current_voltage_relation/@default_erev = -0.08 
   /channelml/channel_type/current_voltage_relation/conc_factor/@ion = ca 
   /channelml/channel_type/current_voltage_relation/conc_factor/@charge = 2 
   /channelml/channel_type/current_voltage_relation/conc_factor/@variable_name = conc 
   /channelml/channel_type/current_voltage_relation/conc_factor/@expr = conc &lt; 250 ? conc/250.0 : 1.0  
   /channelml/channel_type/current_voltage_relation/conc_factor/@min_conc = 0 
   /channelml/channel_type/current_voltage_relation/conc_factor/@max_conc = 1000 
   /channelml/channel_type/current_voltage_relation/gate/@name = X 
   /channelml/channel_type/current_voltage_relation/gate/@instances = 1 
   /channelml/channel_type/current_voltage_relation/gate/closed_state/@id = X0 
   /channelml/channel_type/current_voltage_relation/gate/open_state/@id = X 
   /channelml/channel_type/current_voltage_relation/gate/open_state/@fraction = 1 
   /channelml/channel_type/current_voltage_relation/gate/transition[1]/@name = alpha 
   /channelml/channel_type/current_voltage_relation/gate/transition[1]/@from = X 
   /channelml/channel_type/current_voltage_relation/gate/transition[1]/@to = X0 
   /channelml/channel_type/current_voltage_relation/gate/transition[1]/@expr_form = generic 
   /channelml/channel_type/current_voltage_relation/gate/transition[1]/@expr = v &lt; -0.015 ? (exp (53.872*(v + 0.065) - 0.66835))/0.018975 : 2000*(exp (((-0.065) + 0.0065 - v)/0.027))  
   /channelml/channel_type/current_voltage_relation/gate/transition[2]/@name = beta 
   /channelml/channel_type/current_voltage_relation/gate/transition[2]/@from = X 
   /channelml/channel_type/current_voltage_relation/gate/transition[2]/@to = X0 
   /channelml/channel_type/current_voltage_relation/gate/transition[2]/@expr_form = generic 
   /channelml/channel_type/current_voltage_relation/gate/transition[2]/@expr = v &lt; -0.015 ? 2000*(exp (((-0.065) + 0.0065 - v)/0.027)) - (exp (53.872*(v + 0.065) - 0.66835))/0.018975 : 0.0 
   /channelml/channel_type/impl_prefs/table_settings/@max_v = 0.05 
   /channelml/channel_type/impl_prefs/table_settings/@min_v = -0.1 
   /channelml/channel_type/impl_prefs/table_settings/@table_divisions = 3000 

// File from which this was generated: /home/kali/nC_projects/CA1_NEURON/cellMechanisms/K_C_1D/K_C.xml

// XSL file with mapping to simulator: /home/kali/nC_projects/CA1_NEURON/cellMechanisms/K_C_1D/ChannelML_v1.8.1_NEURONmod.xsl

ENDCOMMENT


?  This is a NEURON mod file generated from a ChannelML file

?  Unit system of original ChannelML file: SI Units

TITLE Channel: K_C_1D

COMMENT
    Calcium dependent K channel in OLM interneuron
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
      

    SUFFIX K_C_1D
    USEION k READ ek WRITE ik VALENCE 1  ? reversal potential of ion is read, outgoing current is written
           
        
    USEION ca READ cai VALENCE 2 ? internal concentration of ion is read

    
    RANGE gmax, gion
    
    RANGE Xinf, Xtau
    
}

PARAMETER { 
      

    gmax = 0.0020 (S/cm2)  ? default value, should be overwritten when conductance placed on cell
    
}



ASSIGNED {
      

    v (mV)
    
    celsius (degC)
          

    ? Reversal potential of k
    ek (mV)
    ? The outward flow of ion: k calculated by rate equations...
    ik (mA/cm2)
          

    ? The internal concentration of ion: ca is used in the rate equations...
    cai (mM)   
    
    
    gion (S/cm2)
    Xinf
    Xtau (ms)
    
}

BREAKPOINT { LOCAL g_factor, conc
    

                        
    SOLVE states METHOD cnexp
         

    gion = gmax*((1*X)^1)
        
    conc = cai / 1
    
    if (conc < 250 ) {
        g_factor =  conc/250.0 
    } else {
        g_factor =  1.0 
    }
    
    gion = gion * g_factor
          

    ik = gion*(v - ek)
            

}



INITIAL {
    
    ek = -80
        
    rates(v)
    X = Xinf
        
    
}
    
STATE {
    X
    
}

DERIVATIVE states {
    rates(v)
    X' = (Xinf - X)/Xtau
    
}

PROCEDURE rates(v(mV)) {  
    
    ? Note: not all of these may be used, depending on the form of rate equations
    LOCAL  alpha, beta, tau, inf, gamma, zeta, temp_adj_X, A_alpha_X, B_alpha_X, Vhalf_alpha_X, A_beta_X, B_beta_X, Vhalf_beta_X
        
    TABLE Xinf, Xtau
 DEPEND celsius
 FROM -100 TO 50 WITH 3000
    
    
    UNITSOFF
    temp_adj_X = 1
    
            
                
           

        
    ?      ***  Adding rate equations for gate: X  ***
         
    ? Found a generic form of the rate equation for alpha, using expression: v < -0.015 ? (exp (53.872*(v + 0.065) - 0.66835))/0.018975 : 2000*(exp (((-0.065) + 0.0065 - v)/0.027)) 
    
    ? Note: Equation (and all ChannelML file values) in SI Units so need to convert v first...
    
    v = v * 0.0010   ? temporarily set v to units of equation...
            
    
    
    if (v < -0.015 ) {
        alpha =  (exp (53.872*(v + 0.065) - 0.66835))/0.018975 
    } else {
        alpha =  2000*(exp (((-0.065) + 0.0065 - v)/0.027)) 
    }
    ? Set correct units of alpha for NEURON
    alpha = alpha * 0.0010 
    
    v = v * 1000   ? reset v
        
     
    ? Found a generic form of the rate equation for beta, using expression: v < -0.015 ? 2000*(exp (((-0.065) + 0.0065 - v)/0.027)) - (exp (53.872*(v + 0.065) - 0.66835))/0.018975 : 0.0
    
    ? Note: Equation (and all ChannelML file values) in SI Units so need to convert v first...
    
    v = v * 0.0010   ? temporarily set v to units of equation...
            
    
    
    if (v < -0.015 ) {
        beta =  2000*(exp (((-0.065) + 0.0065 - v)/0.027)) - (exp (53.872*(v + 0.065) - 0.66835))/0.018975 
    } else {
        beta =  0.0
    }
    ? Set correct units of beta for NEURON
    beta = beta * 0.0010 
    
    v = v * 1000   ? reset v
        
    Xtau = 1/(temp_adj_X*(alpha + beta))
    Xinf = alpha/(alpha + beta)
          
       
    
    ?     *** Finished rate equations for gate: X ***
    

         

}


UNITSON


