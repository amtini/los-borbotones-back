package Clases;

import Clases.ClaseAsiento;
import Repositorio.Entidad;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Asiento implements Entidad {
  private String id;
  
  private boolean alLadoDeLaVentana;
  
  private boolean disponible;
  
  private ClaseAsiento claseDeAsiento;
  
  public float precio() {
    return this.claseDeAsiento.getPrecioClase();
  }
  
  public String getID() {
    return this.id;
  }
  
  public String setID(final String idd) {
    return this.id = this.id;
  }
  
  @Pure
  public String getId() {
    return this.id;
  }
  
  public void setId(final String id) {
    this.id = id;
  }
  
  @Pure
  public boolean isAlLadoDeLaVentana() {
    return this.alLadoDeLaVentana;
  }
  
  public void setAlLadoDeLaVentana(final boolean alLadoDeLaVentana) {
    this.alLadoDeLaVentana = alLadoDeLaVentana;
  }
  
  @Pure
  public boolean isDisponible() {
    return this.disponible;
  }
  
  public void setDisponible(final boolean disponible) {
    this.disponible = disponible;
  }
  
  @Pure
  public ClaseAsiento getClaseDeAsiento() {
    return this.claseDeAsiento;
  }
  
  public void setClaseDeAsiento(final ClaseAsiento claseDeAsiento) {
    this.claseDeAsiento = claseDeAsiento;
  }
}
