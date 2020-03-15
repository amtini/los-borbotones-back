package Clases;

import Clases.Asiento;
import Clases.Vuelo;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Reserva {
  private Vuelo vuelo;
  
  private Asiento asiento;
  
  public Reserva(final Vuelo vuelo_, final Asiento asiento_) {
    this.vuelo = vuelo_;
    this.asiento = asiento_;
  }
  
  public double costoTotal() {
    double _precioDeVuelo = this.vuelo.precioDeVuelo();
    float _precio = this.asiento.precio();
    return (_precioDeVuelo + _precio);
  }
  
  @Pure
  public Vuelo getVuelo() {
    return this.vuelo;
  }
  
  public void setVuelo(final Vuelo vuelo) {
    this.vuelo = vuelo;
  }
  
  @Pure
  public Asiento getAsiento() {
    return this.asiento;
  }
  
  public void setAsiento(final Asiento asiento) {
    this.asiento = asiento;
  }
}
