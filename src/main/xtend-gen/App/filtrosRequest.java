package App;

import java.time.LocalDate;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class filtrosRequest {
  private String origen;
  
  private String destino;
  
  private LocalDate desde;
  
  private LocalDate hasta;
  
  private boolean ventanilla;
  
  @Pure
  public String getOrigen() {
    return this.origen;
  }
  
  public void setOrigen(final String origen) {
    this.origen = origen;
  }
  
  @Pure
  public String getDestino() {
    return this.destino;
  }
  
  public void setDestino(final String destino) {
    this.destino = destino;
  }
  
  @Pure
  public LocalDate getDesde() {
    return this.desde;
  }
  
  public void setDesde(final LocalDate desde) {
    this.desde = desde;
  }
  
  @Pure
  public LocalDate getHasta() {
    return this.hasta;
  }
  
  public void setHasta(final LocalDate hasta) {
    this.hasta = hasta;
  }
  
  @Pure
  public boolean isVentanilla() {
    return this.ventanilla;
  }
  
  public void setVentanilla(final boolean ventanilla) {
    this.ventanilla = ventanilla;
  }
}
