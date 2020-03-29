package Repositorio;

import Clases.Usuario;
import Repositorio.Repositorio;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@SuppressWarnings("all")
public class RepositorioUsuario extends Repositorio<Usuario> {
  @Accessors
  private String tipo = "U";
  
  @Pure
  public String getTipo() {
    return this.tipo;
  }
  
  public void setTipo(final String tipo) {
    this.tipo = tipo;
  }
}
