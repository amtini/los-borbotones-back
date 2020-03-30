package Clases;

import Clases.Asiento;
import Clases.Vuelo;
import com.fasterxml.jackson.annotation.JsonProperty;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Ticket {
  private Vuelo vuelo;
  
  private Asiento asiento;
  
  public Ticket(final Vuelo vuelo_, final Asiento asiento_) {
    this.vuelo = vuelo_;
    this.asiento = asiento_;
  }
  
  @JsonProperty
  public void reservar() {
    this.asiento.setDisponible(false);
  }
  
  @JsonProperty
  public void cancelarReserva() {
    this.asiento.setDisponible(true);
  }
  
  @JsonProperty
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
