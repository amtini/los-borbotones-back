package Repositorio;

import Clases.Usuario;
import Repositorio.Repositorio;
import com.google.common.base.Objects;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;

@SuppressWarnings("all")
public class RepositorioUsuario extends Repositorio<Usuario> {
  @Accessors
  private String tipo = "U";
  
  public Usuario verificarLogin(final String usuarioLogin, final String passwordLogin) {
    final Function1<Usuario, Boolean> _function = new Function1<Usuario, Boolean>() {
      public Boolean apply(final Usuario usuario) {
        return Boolean.valueOf(usuario.verificarUsuario(usuarioLogin, passwordLogin));
      }
    };
    return IterableExtensions.<Usuario>findFirst(this.getElementos(), _function);
  }
  
  public boolean agregarAmigo(final String id, final String nombreAmigo) {
    boolean _xifexpression = false;
    if (((this.verificarAmigo(nombreAmigo) == null) && this.searchByID(id).getAmigos().contains(this.verificarAmigo(nombreAmigo)))) {
      _xifexpression = this.searchByID(id).agregarAmigo(this.verificarAmigo(nombreAmigo));
    }
    return _xifexpression;
  }
  
  public boolean eliminarAmigo(final String id, final String nombreAmigo) {
    boolean _xifexpression = false;
    if (((this.verificarAmigo(nombreAmigo) == null) && this.searchByID(id).getAmigos().contains(this.verificarAmigo(nombreAmigo)))) {
      _xifexpression = this.searchByID(id).removerAmigo(this.verificarAmigo(nombreAmigo));
    }
    return _xifexpression;
  }
  
  public Usuario verificarAmigo(final String nombreAmigo) {
    final Function1<Usuario, Boolean> _function = new Function1<Usuario, Boolean>() {
      public Boolean apply(final Usuario usuario) {
        String _nombre = usuario.getNombre();
        return Boolean.valueOf(Objects.equal(_nombre, nombreAmigo));
      }
    };
    return IterableExtensions.<Usuario>findFirst(this.getElementos(), _function);
  }
  
  @Pure
  public String getTipo() {
    return this.tipo;
  }
  
  public void setTipo(final String tipo) {
    this.tipo = tipo;
  }
}