
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import EJB.CategoriaFacadeLocal;
import Model.Categoria;
import java.io.Serializable;

import java.util.Objects;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
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
public class AltaCategoriaController implements Serializable {
 
    private Categoria categoria;
  
    
     @EJB
    private CategoriaFacadeLocal categoriaEJB;
    
    
    
    @PostConstruct
    public void init(){
   
        categoria = new Categoria();
        
    }
    
    public void insertarCategoria(){
        
        
        //ConexionBD.conexion(); // metodo estatico para establecer conexion
        try{
            categoriaEJB.create(categoria);
            System.out.println(categoria.getNombre()+ " insertada correctamente");
        } catch(Exception e){
            
            System.out.println("Error al insertar categoria en la base de datos "+ e.getMessage());
        }
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public CategoriaFacadeLocal getCategoriaEJB() {
        return categoriaEJB;
    }

    public void setCategoriaEJB(CategoriaFacadeLocal categoriaEJB) {
        this.categoriaEJB = categoriaEJB;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 67 * hash + Objects.hashCode(this.categoria);
        hash = 67 * hash + Objects.hashCode(this.categoriaEJB);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final AltaCategoriaController other = (AltaCategoriaController) obj;
        if (!Objects.equals(this.categoria, other.categoria)) {
            return false;
        }
        if (!Objects.equals(this.categoriaEJB, other.categoriaEJB)) {
            return false;
        }
        return true;
    }
    
    
}
