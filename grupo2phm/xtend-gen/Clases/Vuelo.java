package Clases;

import Clases.Aerolinea;
import Clases.Avion;
import Repositorio.Entidad;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.DoubleExtensions;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Vuelo implements Entidad {
  private String id;
  
  private String ciudadDeOrigen;
  
  private String ciudadDeDestino;
  
  private LocalDate horarioDePartida;
  
  private LocalDate horarioDeLlegada;
  
  private Aerolinea aerolinea;
  
  private Avion avion;
  
  private Double precioBase;
  
  @Override
  public String getID() {
    return this.id;
  }
  
  @Override
  public String setID(final String idd) {
    return this.id = idd;
  }
  
  public double precioDeVuelo() {
    Double _precioAsiento = this.aerolinea.getPrecioAsiento();
    double _plus = DoubleExtensions.operator_plus(this.precioBase, _precioAsiento);
    double _recargoUltimosPasajes = this.avion.recargoUltimosPasajes();
    return (_plus * _recargoUltimosPasajes);
  }
  
  public double duracionDeViaje() {
    return ChronoUnit.HOURS.between(this.horarioDePartida, this.horarioDeLlegada);
  }
  
  @Pure
  public String getId() {
    return this.id;
  }
  
  public void setId(final String id) {
    this.id = id;
  }
  
  @Pure
  public String getCiudadDeOrigen() {
    return this.ciudadDeOrigen;
  }
  
  public void setCiudadDeOrigen(final String ciudadDeOrigen) {
    this.ciudadDeOrigen = ciudadDeOrigen;
  }
  
  @Pure
  public String getCiudadDeDestino() {
    return this.ciudadDeDestino;
  }
  
  public void setCiudadDeDestino(final String ciudadDeDestino) {
    this.ciudadDeDestino = ciudadDeDestino;
  }
  
  @Pure
  public LocalDate getHorarioDePartida() {
    return this.horarioDePartida;
  }
  
  public void setHorarioDePartida(final LocalDate horarioDePartida) {
    this.horarioDePartida = horarioDePartida;
  }
  
  @Pure
  public LocalDate getHorarioDeLlegada() {
    return this.horarioDeLlegada;
  }
  
  public void setHorarioDeLlegada(final LocalDate horarioDeLlegada) {
    this.horarioDeLlegada = horarioDeLlegada;
  }
  
  @Pure
  public Aerolinea getAerolinea() {
    return this.aerolinea;
  }
  
  public void setAerolinea(final Aerolinea aerolinea) {
    this.aerolinea = aerolinea;
  }
  
  @Pure
  public Avion getAvion() {
    return this.avion;
  }
  
  public void setAvion(final Avion avion) {
    this.avion = avion;
  }
  
  @Pure
  public Double getPrecioBase() {
    return this.precioBase;
  }
  
  public void setPrecioBase(final Double precioBase) {
    this.precioBase = precioBase;
  }
}
