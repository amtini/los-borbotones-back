package Clases;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Aerolinea {
  private String name;
  
  private Double precioAsiento;
  
  @Pure
  public String getName() {
    return this.name;
  }
  
  public void setName(final String name) {
    this.name = name;
  }
  
  @Pure
  public Double getPrecioAsiento() {
    return this.precioAsiento;
  }
  
  public void setPrecioAsiento(final Double precioAsiento) {
    this.precioAsiento = precioAsiento;
  }
}
