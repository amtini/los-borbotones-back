package Repositorio;

import Clases.Asiento;
import Repositorio.Repositorio;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@SuppressWarnings("all")
public class RepositorioAsiento extends Repositorio<Asiento> {
  @Accessors
  private String tipo = "P";
  
  @Pure
  public String getTipo() {
    return this.tipo;
  }
  
  public void setTipo(final String tipo) {
    this.tipo = tipo;
  }
}
