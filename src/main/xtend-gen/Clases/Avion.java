package Clases;

import Clases.Asiento;
import java.util.HashSet;
import java.util.Set;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Avion {
  private String nombre;
  
  private Set<Asiento> asientos = new HashSet<Asiento>();
  
  public double recargoUltimosPasajes() {
    double _xifexpression = (double) 0;
    int _length = ((Object[])Conversions.unwrapArray(this.asientos, Object.class)).length;
    boolean _lessEqualsThan = (_length <= 2);
    if (_lessEqualsThan) {
      _xifexpression = 1.15;
    } else {
      _xifexpression = 1;
    }
    return _xifexpression;
  }
  
  public Iterable<Asiento> asientosDisponibles() {
    final Function1<Asiento, Boolean> _function = new Function1<Asiento, Boolean>() {
      public Boolean apply(final Asiento it) {
        boolean _isDisponible = it.isDisponible();
        return Boolean.valueOf((_isDisponible == true));
      }
    };
    return IterableExtensions.<Asiento>filter(this.asientos, _function);
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public Set<Asiento> getAsientos() {
    return this.asientos;
  }
  
  public void setAsientos(final Set<Asiento> asientos) {
    this.asientos = asientos;
  }
}
