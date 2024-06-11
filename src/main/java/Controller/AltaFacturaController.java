/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import EJB.ClienteFacadeLocal;
import EJB.FacturaFacadeLocal;
import EJB.MaterialFacadeLocal;
import EJB.StockMaterialFacadeLocal;
import EJB.TrabajadorFacadeLocal;
import Model.Cliente;
import Model.Factura;
import Model.Material;
import Model.StockMaterial;
import Model.Trabajador;
import java.io.Serializable;
import java.util.List;
import java.util.Objects;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

/**
 *
 * @author Jose Maria
 * 
 * 
 */

@Named
@ViewScoped
public class AltaFacturaController implements Serializable {
    
    @Inject
    private Factura factura;
    
    @Inject
    private Cliente cliente;
    
    @Inject
    private Material material;
    
      @Inject
    private Trabajador trabajador;
    
    @EJB
    private FacturaFacadeLocal facturaEJB;
    
    @EJB
    private ClienteFacadeLocal clienteEJB;
    
    @EJB
    private MaterialFacadeLocal materialEJB;
    
    
    @EJB
    private TrabajadorFacadeLocal trabajadorEJB;
        
    @EJB
    
    private StockMaterialFacadeLocal stockEJB;
     
    private List<Cliente>listaClientes;
     
     private List<Material>listaMateriales;
     
     private List<Trabajador> listaTrabajadores;
     
     private List <StockMaterial> listadoStock;
     
     
     
     
     @PostConstruct
   
     public void init(){
         factura = new Factura();
         cliente = new Cliente();
         material = new Material();
         trabajador = new Trabajador();
         listaClientes = clienteEJB.findAll();
         listaMateriales = materialEJB.findAll();
         listadoStock = stockEJB.findAll();
         listaTrabajadores = trabajadorEJB.findAll();
     }
     
     public void insertarFactura(){
         
         try{
             factura.setMaterial(material);
             factura.setCliente(cliente);
             factura.setTrabajador(trabajador);
             factura.setTotal_bruto(facturaEJB.calcularTotalBrutoFactura(factura));
             factura.setTotal(facturaEJB.calcularTotalFactura(factura));
             int sumatotal =0;
             for(int i = 0; i < listadoStock.size();i++){
                 
                 if(listadoStock.get(i).getMaterial().getIdMaterial() == factura.getMaterial().getIdMaterial()){
                     sumatotal = sumatotal+ listadoStock.get(i).getCantidadReal();
                 }
             }
             
             if(sumatotal < factura.getCantidad()  ){
             FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Info", "Factura no se puede crear porque no hay stock suficiente "));    
             } else {
             facturaEJB.create(factura);
             System.out.println("factura  creada correctamente con id: "+factura.getN_factura());
             FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Info", "Factura creado correctamente "+factura.getN_factura()));    
             }
             
         } catch(Exception e){
             System.out.println("Error al insertar el factura: "+e.getMessage());
         }
     }

    public Factura getFactura() {
        return factura;
    }

    public void setFactura(Factura factura) {
        this.factura = factura;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Material getMaterial() {
        return material;
    }

    public void setMaterial(Material material) {
        this.material = material;
    }

    public FacturaFacadeLocal getFacturaEJB() {
        return facturaEJB;
    }

    public void setFacturaEJB(FacturaFacadeLocal facturaEJB) {
        this.facturaEJB = facturaEJB;
    }

    public ClienteFacadeLocal getClienteEJB() {
        return clienteEJB;
    }

    public void setClienteEJB(ClienteFacadeLocal clienteEJB) {
        this.clienteEJB = clienteEJB;
    }

    public MaterialFacadeLocal getMaterialEJB() {
        return materialEJB;
    }

    public void setMaterialEJB(MaterialFacadeLocal materialEJB) {
        this.materialEJB = materialEJB;
    }

    public List<Cliente> getListaClientes() {
        return listaClientes;
    }

    public void setListaClientes(List<Cliente> listaClientes) {
        this.listaClientes = listaClientes;
    }

    public List<Material> getListaMateriales() {
        return listaMateriales;
    }

    public void setListaMateriales(List<Material> listaMateriales) {
        this.listaMateriales = listaMateriales;
    }

    public Trabajador getTrabajador() {
        return trabajador;
    }

    public void setTrabajador(Trabajador trabajador) {
        this.trabajador = trabajador;
    }

    public TrabajadorFacadeLocal getTrabajadorEJB() {
        return trabajadorEJB;
    }

    public void setTrabajadorEJB(TrabajadorFacadeLocal trabajadorEJB) {
        this.trabajadorEJB = trabajadorEJB;
    }

    public StockMaterialFacadeLocal getStockEJB() {
        return stockEJB;
    }

    public void setStockEJB(StockMaterialFacadeLocal stockEJB) {
        this.stockEJB = stockEJB;
    }

    public List<Trabajador> getListaTrabajadores() {
        return listaTrabajadores;
    }

    public void setListaTrabajadores(List<Trabajador> listaTrabajadores) {
        this.listaTrabajadores = listaTrabajadores;
    }

    public List<StockMaterial> getListadoStock() {
        return listadoStock;
    }

    public void setListadoStock(List<StockMaterial> listadoStock) {
        this.listadoStock = listadoStock;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 83 * hash + Objects.hashCode(this.factura);
        hash = 83 * hash + Objects.hashCode(this.cliente);
        hash = 83 * hash + Objects.hashCode(this.material);
        hash = 83 * hash + Objects.hashCode(this.trabajador);
        hash = 83 * hash + Objects.hashCode(this.facturaEJB);
        hash = 83 * hash + Objects.hashCode(this.clienteEJB);
        hash = 83 * hash + Objects.hashCode(this.materialEJB);
        hash = 83 * hash + Objects.hashCode(this.trabajadorEJB);
        hash = 83 * hash + Objects.hashCode(this.stockEJB);
        hash = 83 * hash + Objects.hashCode(this.listaClientes);
        hash = 83 * hash + Objects.hashCode(this.listaMateriales);
        hash = 83 * hash + Objects.hashCode(this.listaTrabajadores);
        hash = 83 * hash + Objects.hashCode(this.listadoStock);
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
        final AltaFacturaController other = (AltaFacturaController) obj;
        if (!Objects.equals(this.factura, other.factura)) {
            return false;
        }
        if (!Objects.equals(this.cliente, other.cliente)) {
            return false;
        }
        if (!Objects.equals(this.material, other.material)) {
            return false;
        }
        if (!Objects.equals(this.trabajador, other.trabajador)) {
            return false;
        }
        if (!Objects.equals(this.facturaEJB, other.facturaEJB)) {
            return false;
        }
        if (!Objects.equals(this.clienteEJB, other.clienteEJB)) {
            return false;
        }
        if (!Objects.equals(this.materialEJB, other.materialEJB)) {
            return false;
        }
        if (!Objects.equals(this.trabajadorEJB, other.trabajadorEJB)) {
            return false;
        }
        if (!Objects.equals(this.stockEJB, other.stockEJB)) {
            return false;
        }
        if (!Objects.equals(this.listaClientes, other.listaClientes)) {
            return false;
        }
        if (!Objects.equals(this.listaMateriales, other.listaMateriales)) {
            return false;
        }
        if (!Objects.equals(this.listaTrabajadores, other.listaTrabajadores)) {
            return false;
        }
        if (!Objects.equals(this.listadoStock, other.listadoStock)) {
            return false;
        }
        return true;
    }

    
     
    
}
