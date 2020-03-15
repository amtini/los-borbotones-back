package Clases;

import Clases.Ruta;
import Clases.Vuelo;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.DoubleExtensions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class VueloCompuesto extends Vuelo {
  private Set<Ruta> escalas = new HashSet<Ruta>();
  
  public Double getDuracionDeViaje() {
    final Function2<Double, Ruta, Double> _function = (Double acum, Ruta ruta) -> {
      long _duracionDeViaje = ruta.duracionDeViaje();
      return Double.valueOf(((acum).doubleValue() + _duracionDeViaje));
    };
    return IterableExtensions.<Ruta, Double>fold(this.escalas, Double.valueOf(0.0), _function);
  }
  
  @Override
  public double precioDeVuelo() {
    Double _precioBase = this.getPrecioBase();
    Double _precioAsiento = this.getAerolinea().getPrecioAsiento();
    double _plus = DoubleExtensions.operator_plus(_precioBase, _precioAsiento);
    return (_plus * 0.9);
  }
  
  public Object tiempoEntreVuelos() {
    return null;
  }
  
  public List<Ruta> ordenarSegunTiempo() {
    final Function1<Ruta, LocalDate> _function = (Ruta it) -> {
      return it.getHorarioDePartida();
    };
    return IterableExtensions.<Ruta, LocalDate>sortBy(this.escalas, _function);
  }
  
  @Pure
  public Set<Ruta> getEscalas() {
    return this.escalas;
  }
  
  public void setEscalas(final Set<Ruta> escalas) {
    this.escalas = escalas;
  }
}
