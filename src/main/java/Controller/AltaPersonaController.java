/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import EJB.PersonasFacadeLocal;
import Model.Personas;
import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;
import javax.inject.Named;

/**
 *
 * @author Jose Maria
 */
@Named
@ViewScoped
public class AltaPersonaController implements Serializable {
    
    
    private Personas persona;
    
    
    @EJB
    private PersonasFacadeLocal personaEJB;
    
    @PostConstruct
    public void init(){
       persona = new Personas(); 
    }
    
    
    public void insertarPersona(){
        
        try{
            
            personaEJB.create(persona);
            System.out.println("persona: "+persona.getNombre() +" inseertada correctamente");
            
        } catch(Exception e){
            System.out.println("Error al insertar persona en la base de datos "+ e.getMessage());
        }
    }
}
