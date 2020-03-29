package Clases;

import Clases.Asiento;
import java.util.HashSet;
import java.util.Set;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Avion {
  private String nombre;
  
  private Set<Asiento> asientosDisponibles = new HashSet<Asiento>();
  
  public double recargoUltimosPasajes() {
    double _xifexpression = (double) 0;
    int _length = ((Object[])Conversions.unwrapArray(this.asientosDisponibles, Object.class)).length;
    boolean _lessEqualsThan = (_length <= 2);
    if (_lessEqualsThan) {
      _xifexpression = 1.15;
    } else {
      _xifexpression = 1;
    }
    return _xifexpression;
  }
  
  public boolean agregarAsiento(final Asiento asiento) {
    return this.asientosDisponibles.add(asiento);
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public Set<Asiento> getAsientosDisponibles() {
    return this.asientosDisponibles;
  }
  
  public void setAsientosDisponibles(final Set<Asiento> asientosDisponibles) {
    this.asientosDisponibles = asientosDisponibles;
  }
}
