package Clases;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Aerolinea {
  private String nombre;
  
  private Double precioAsiento;
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public Double getPrecioAsiento() {
    return this.precioAsiento;
  }
  
  public void setPrecioAsiento(final Double precioAsiento) {
    this.precioAsiento = precioAsiento;
  }
}
