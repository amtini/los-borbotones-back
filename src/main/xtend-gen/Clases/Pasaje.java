package Clases;

import Clases.Asiento;
import Clases.Vuelo;
import java.time.LocalDate;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Pasaje {
  private Vuelo vuelo;
  
  private Asiento asiento;
  
  private double costo;
  
  private LocalDate comprado;
  
  public Pasaje(final Vuelo vuelo_, final Asiento asiento_, final double costo_) {
    this.vuelo = vuelo_;
    this.asiento = asiento_;
    this.costo = costo_;
    this.comprado = LocalDate.now();
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
  
  @Pure
  public double getCosto() {
    return this.costo;
  }
  
  public void setCosto(final double costo) {
    this.costo = costo;
  }
  
  @Pure
  public LocalDate getComprado() {
    return this.comprado;
  }
  
  public void setComprado(final LocalDate comprado) {
    this.comprado = comprado;
  }
}
