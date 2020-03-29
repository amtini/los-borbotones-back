package Clases;

import Clases.Asiento;
import Clases.Vuelo;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Ticket {
  private Vuelo vuelo;
  
  private Asiento asiento;
  
  public void reservar() {
    this.asiento.setDisponible(false);
  }
  
  public void cancelarReserva() {
    this.asiento.setDisponible(true);
  }
  
  public double costo() {
    double _precioDeVuelo = this.vuelo.precioDeVuelo();
    float _precioClase = this.asiento.getClaseDeAsiento().getPrecioClase();
    return (_precioDeVuelo + _precioClase);
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
