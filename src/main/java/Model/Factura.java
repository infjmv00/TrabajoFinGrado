/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 *
 * @author Jose Maria
 */


@Entity
@Table(name="tblFacturas")
public class Factura implements Serializable {
    
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int n_factura;

    @ManyToOne
    @JoinColumn(name = "id_Cliente", nullable = false)
    private Cliente cliente;
    
    @OneToOne
    @JoinColumn(name = "id_material", nullable = false)
    private Material material;

    @Column(name = "descripcion")
    private String descripcion;

    @Column(name = "cantidad")
    private int cantidad; 

    @Column(name = "tipo")
    private String tipo;


    @Column(name = "iva_aplicado")
    private float iva_aplicado;
    
    @Column(name = "precio_unitario")
    private float precio_unitario;

    
    @Column(name = "total")
    private float total;
    
     @Column(name = "total_bruto")
    private float total_bruto;
     
     
    @Column(name="FechaFactura") 
    private Date fecha_factura;
    
    @ManyToOne
    @JoinColumn(name = "id_trabajador", nullable = false)
    private Trabajador trabajador;

    public int getN_factura() {
        return n_factura;
    }

    public void setN_factura(int n_factura) {
        this.n_factura = n_factura;
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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public float getIva_aplicado() {
        return iva_aplicado;
    }

    public void setIva_aplicado(float iva_aplicado) {
        this.iva_aplicado = iva_aplicado;
    }

    public float getPrecio_unitario() {
        return precio_unitario;
    }

    public void setPrecio_unitario(float precio_unitario) {
        this.precio_unitario = precio_unitario;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public float getTotal_bruto() {
        return total_bruto;
    }

    public void setTotal_bruto(float total_bruto) {
        this.total_bruto = total_bruto;
    }

    public Date getFecha_factura() {
        return fecha_factura;
    }

    public void setFecha_factura(Date fecha_factura) {
        this.fecha_factura = fecha_factura;
    }

    public Trabajador getTrabajador() {
        return trabajador;
    }

    public void setTrabajador(Trabajador trabajador) {
        this.trabajador = trabajador;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 67 * hash + this.n_factura;
        hash = 67 * hash + Objects.hashCode(this.cliente);
        hash = 67 * hash + Objects.hashCode(this.material);
        hash = 67 * hash + Objects.hashCode(this.descripcion);
        hash = 67 * hash + this.cantidad;
        hash = 67 * hash + Objects.hashCode(this.tipo);
        hash = 67 * hash + Float.floatToIntBits(this.iva_aplicado);
        hash = 67 * hash + Float.floatToIntBits(this.precio_unitario);
        hash = 67 * hash + Float.floatToIntBits(this.total);
        hash = 67 * hash + Float.floatToIntBits(this.total_bruto);
        hash = 67 * hash + Objects.hashCode(this.fecha_factura);
        hash = 67 * hash + Objects.hashCode(this.trabajador);
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
        final Factura other = (Factura) obj;
        if (this.n_factura != other.n_factura) {
            return false;
        }
        if (this.cantidad != other.cantidad) {
            return false;
        }
        if (Float.floatToIntBits(this.iva_aplicado) != Float.floatToIntBits(other.iva_aplicado)) {
            return false;
        }
        if (Float.floatToIntBits(this.precio_unitario) != Float.floatToIntBits(other.precio_unitario)) {
            return false;
        }
        if (Float.floatToIntBits(this.total) != Float.floatToIntBits(other.total)) {
            return false;
        }
        if (Float.floatToIntBits(this.total_bruto) != Float.floatToIntBits(other.total_bruto)) {
            return false;
        }
        if (!Objects.equals(this.descripcion, other.descripcion)) {
            return false;
        }
        if (!Objects.equals(this.tipo, other.tipo)) {
            return false;
        }
        if (!Objects.equals(this.cliente, other.cliente)) {
            return false;
        }
        if (!Objects.equals(this.material, other.material)) {
            return false;
        }
        if (!Objects.equals(this.fecha_factura, other.fecha_factura)) {
            return false;
        }
        if (!Objects.equals(this.trabajador, other.trabajador)) {
            return false;
        }
        return true;
    }

   
    

    

}
