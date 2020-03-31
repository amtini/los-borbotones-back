package Clases;

import Clases.Aerolinea;
import Clases.Avion;
import Repositorio.Entidad;
import com.google.common.base.Objects;
import java.time.LocalDate;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.DoubleExtensions;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Vuelo implements Entidad {
  private String ID;
  
  private String ciudadDeOrigen;
  
  private String ciudadDeDestino;
  
  private LocalDate horarioDePartida;
  
  private Aerolinea aerolinea;
  
  private Double duracionDeVuelo;
  
  private Avion avion;
  
  private int cantidadEscalas;
  
  private Double precioBase;
  
  public String getID() {
    return this.ID;
  }
  
  public String setID(final String idd) {
    return this.ID = idd;
  }
  
  public double precioDeVuelo() {
    Double _precioAsiento = this.aerolinea.getPrecioAsiento();
    double _plus = DoubleExtensions.operator_plus(this.precioBase, _precioAsiento);
    double _recargoUltimosPasajes = this.avion.recargoUltimosPasajes();
    return (_plus * _recargoUltimosPasajes);
  }
  
  public double precioMinimoPasaje() {
    double _precioDeVuelo = this.precioDeVuelo();
    float _precio = this.avion.asientoMasBarato().precio();
    return (_precioDeVuelo + _precio);
  }
  
  public boolean cumpleLosFiltros(final String origen_, final String destino_, final LocalDate desde, final LocalDate hasta) {
    return (((Objects.equal(this.ciudadDeDestino, destino_) && Objects.equal(this.ciudadDeOrigen, origen_)) && (this.horarioDePartida.compareTo(desde) >= 0)) && (this.horarioDePartida.compareTo(hasta) <= 0));
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
  public Aerolinea getAerolinea() {
    return this.aerolinea;
  }
  
  public void setAerolinea(final Aerolinea aerolinea) {
    this.aerolinea = aerolinea;
  }
  
  @Pure
  public Double getDuracionDeVuelo() {
    return this.duracionDeVuelo;
  }
  
  public void setDuracionDeVuelo(final Double duracionDeVuelo) {
    this.duracionDeVuelo = duracionDeVuelo;
  }
  
  @Pure
  public Avion getAvion() {
    return this.avion;
  }
  
  public void setAvion(final Avion avion) {
    this.avion = avion;
  }
  
  @Pure
  public int getCantidadEscalas() {
    return this.cantidadEscalas;
  }
  
  public void setCantidadEscalas(final int cantidadEscalas) {
    this.cantidadEscalas = cantidadEscalas;
  }
  
  @Pure
  public Double getPrecioBase() {
    return this.precioBase;
  }
  
  public void setPrecioBase(final Double precioBase) {
    this.precioBase = precioBase;
  }
}
