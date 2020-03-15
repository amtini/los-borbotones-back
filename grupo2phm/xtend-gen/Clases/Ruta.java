package Clases;

import Repositorio.Entidad;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Ruta implements Entidad {
  private String id;
  
  private String ciudadDeOrigen;
  
  private String ciudadDeDestino;
  
  private LocalDate horarioDePartida;
  
  private LocalDate horarioDeLlegada;
  
  public long duracionDeViaje() {
    return ChronoUnit.HOURS.between(this.horarioDePartida, this.horarioDeLlegada);
  }
  
  @Override
  public String getID() {
    return this.id;
  }
  
  @Override
  public String setID(final String idd) {
    return this.id = idd;
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
}
