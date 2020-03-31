package Clases;

import Clases.Vuelo;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.DoubleExtensions;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class VueloCompuesto extends Vuelo {
  private List<Vuelo> escalas = new ArrayList<Vuelo>();
  
  public Double getDuracionDeVuelo() {
    final Function2<Double, Vuelo, Double> _function = new Function2<Double, Vuelo, Double>() {
      public Double apply(final Double acum, final Vuelo vuelo) {
        Double _duracionDeVuelo = vuelo.getDuracionDeVuelo();
        return Double.valueOf(DoubleExtensions.operator_plus(acum, _duracionDeVuelo));
      }
    };
    return IterableExtensions.<Vuelo, Double>fold(this.escalas, Double.valueOf(0.0), _function);
  }
  
  public double precioDeVuelo() {
    Double _precioBase = this.getPrecioBase();
    Double _precioAsiento = this.getAerolinea().getPrecioAsiento();
    double _plus = DoubleExtensions.operator_plus(_precioBase, _precioAsiento);
    double _multiply = (_plus * 0.9);
    double _recargoUltimosPasajes = this.getAvion().recargoUltimosPasajes();
    return (_multiply * _recargoUltimosPasajes);
  }
  
  public int getCantidadEscalas() {
    return this.escalas.size();
  }
  
  public boolean tieneEscalas() {
    int _cantidadEscalas = this.getCantidadEscalas();
    return (_cantidadEscalas > 1);
  }
  
  @Pure
  public List<Vuelo> getEscalas() {
    return this.escalas;
  }
  
  public void setEscalas(final List<Vuelo> escalas) {
    this.escalas = escalas;
  }
}
