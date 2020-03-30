package App;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class usuarioLogeadoRequest {
  private String usuario;
  
  private String password;
  
  @Pure
  public String getUsuario() {
    return this.usuario;
  }
  
  public void setUsuario(final String usuario) {
    this.usuario = usuario;
  }
  
  @Pure
  public String getPassword() {
    return this.password;
  }
  
  public void setPassword(final String password) {
    this.password = password;
  }
}
