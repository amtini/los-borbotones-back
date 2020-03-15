package Clases;

import Clases.Aerolinea;
import Clases.Asiento;
import Clases.Avion;
import Clases.Ruta;
import Repositorio.Entidad;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.DoubleExtensions;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Vuelo implements Entidad {
  private String id;
  
  private Ruta ruta;
  
  private String ciudadDeOrigen;
  
  private String ciudadDeDestino;
  
  private Aerolinea aerolinea;
  
  private LocalDate horarioDePartida;
  
  private Avion avion;
  
  private Set<Asiento> asientosDisponibles = new HashSet<Asiento>();
  
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
    double _recargoUltimosPasajes = this.recargoUltimosPasajes();
    return (_plus * _recargoUltimosPasajes);
  }
  
  public double recargoUltimosPasajes() {
    double _xifexpression = (double) 0;
    int _length = ((Object[])Conversions.unwrapArray(this.asientosDisponibles, Object.class)).length;
    boolean _lessEqualsThan = (_length <= 2);
    if (_lessEqualsThan) {
      _xifexpression = 1.15;
    } else {
      _xifexpression = 1;
    }
    return _xifexpression;
  }
  
  public boolean comprarPasaje(final Asiento asientoAComprar) {
    return this.asientosDisponibles.remove(asientoAComprar);
  }
  
  @Pure
  public String getId() {
    return this.id;
  }
  
  public void setId(final String id) {
    this.id = id;
  }
  
  @Pure
  public Ruta getRuta() {
    return this.ruta;
  }
  
  public void setRuta(final Ruta ruta) {
    this.ruta = ruta;
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
  public Aerolinea getAerolinea() {
    return this.aerolinea;
  }
  
  public void setAerolinea(final Aerolinea aerolinea) {
    this.aerolinea = aerolinea;
  }
  
  @Pure
  public LocalDate getHorarioDePartida() {
    return this.horarioDePartida;
  }
  
  public void setHorarioDePartida(final LocalDate horarioDePartida) {
    this.horarioDePartida = horarioDePartida;
  }
  
  @Pure
  public Avion getAvion() {
    return this.avion;
  }
  
  public void setAvion(final Avion avion) {
    this.avion = avion;
  }
  
  @Pure
  public Set<Asiento> getAsientosDisponibles() {
    return this.asientosDisponibles;
  }
  
  public void setAsientosDisponibles(final Set<Asiento> asientosDisponibles) {
    this.asientosDisponibles = asientosDisponibles;
  }
  
  @Pure
  public Double getPrecioBase() {
    return this.precioBase;
  }
  
  public void setPrecioBase(final Double precioBase) {
    this.precioBase = precioBase;
  }
}
