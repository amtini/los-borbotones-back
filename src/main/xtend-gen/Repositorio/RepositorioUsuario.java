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
  
  public Object agregarAmigo(final String id, final String usuarioAmigo) {
    Object _xifexpression = null;
    boolean _existeUsuarioNombre = this.existeUsuarioNombre(usuarioAmigo);
    if (_existeUsuarioNombre) {
      _xifexpression = this.searchByID(id).agregarAmigo(this.verificarAmigo(usuarioAmigo));
    }
    return _xifexpression;
  }
  
  public boolean eliminarAmigo(final String id, final String id2) {
    boolean _xifexpression = false;
    if (((this.searchByID(id2) != null) && this.searchByID(id).getAmigos().contains(this.searchByID(id2)))) {
      _xifexpression = this.searchByID(id).removerAmigo(this.searchByID(id2));
    }
    return _xifexpression;
  }
  
  public Usuario verificarAmigo(final String usuarioAmigo) {
    final Function1<Usuario, Boolean> _function = new Function1<Usuario, Boolean>() {
      public Boolean apply(final Usuario usuario) {
        String _usuario = usuario.getUsuario();
        return Boolean.valueOf(Objects.equal(_usuario, usuarioAmigo));
      }
    };
    return IterableExtensions.<Usuario>findFirst(this.getElementos(), _function);
  }
  
  public boolean existeUsuarioNombre(final String nombreAmigo) {
    return this.getElementos().contains(this.verificarAmigo(nombreAmigo));
  }
  
  @Pure
  public String getTipo() {
    return this.tipo;
  }
  
  public void setTipo(final String tipo) {
    this.tipo = tipo;
  }
}
