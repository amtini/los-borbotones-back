package Clases;

import Clases.Vuelo;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.DoubleExtensions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class VueloCompuesto extends Vuelo {
  private List<Vuelo> escalas = new ArrayList<Vuelo>();
  
  public double getDuracionDeViaje() {
    return ChronoUnit.HOURS.between(IterableExtensions.<Vuelo>head(this.escalas).getHorarioDePartida(), IterableExtensions.<Vuelo>last(this.escalas).getHorarioDeLlegada());
  }
  
  public double getPrecioDeVuelo() {
    Double _precioBase = this.getPrecioBase();
    Double _precioAsiento = this.getAerolinea().getPrecioAsiento();
    double _plus = DoubleExtensions.operator_plus(_precioBase, _precioAsiento);
    double _multiply = (_plus * 0.9);
    double _recargoUltimosPasajes = this.getAvion().recargoUltimosPasajes();
    return (_multiply * _recargoUltimosPasajes);
  }
  
  public List<Vuelo> ordenarSegunTiempo() {
    final Function1<Vuelo, LocalDate> _function = new Function1<Vuelo, LocalDate>() {
      public LocalDate apply(final Vuelo it) {
        return it.getHorarioDePartida();
      }
    };
    return IterableExtensions.<Vuelo, LocalDate>sortBy(this.escalas, _function);
  }
  
  public int cantidadDeEscalas() {
    return this.escalas.size();
  }
  
  @Pure
  public List<Vuelo> getEscalas() {
    return this.escalas;
  }
  
  public void setEscalas(final List<Vuelo> escalas) {
    this.escalas = escalas;
  }
}
