package Clases;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class ClaseAsiento {
  private float precioClase;
  
  @Pure
  public float getPrecioClase() {
    return this.precioClase;
  }
  
  public void setPrecioClase(final float precioClase) {
    this.precioClase = precioClase;
  }
}
