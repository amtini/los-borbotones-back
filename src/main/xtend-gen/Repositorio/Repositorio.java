package Repositorio;

import Repositorio.Entidad;
import com.google.common.base.Objects;
import java.util.HashSet;
import java.util.Set;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public abstract class Repositorio<T extends Entidad> {
  private String tipo;
  
  private Set<T> elementos = new HashSet<T>();
  
  private int id = 0;
  
  public void create(final T element) {
    String _iD = element.getID();
    boolean _tripleEquals = (_iD == null);
    if (_tripleEquals) {
      this.id++;
      element.setID(this.newID());
      this.elementos.add(element);
    } else {
      this.elementos.add(element);
    }
  }
  
  public String newID() {
    String _tipo = this.getTipo();
    String _string = Integer.valueOf(this.id).toString();
    return (_tipo + _string);
  }
  
  public boolean delete(final T element) {
    return this.elementos.remove(element);
  }
  
  public void update(final T elementoNuevo) {
    String id = elementoNuevo.getID();
    T elementoViejo = this.searchByID(id);
    this.delete(elementoViejo);
    this.create(elementoNuevo);
  }
  
  public T searchByID(final String id) {
    final Function1<T, Boolean> _function = new Function1<T, Boolean>() {
      public Boolean apply(final T element) {
        String _iD = element.getID();
        return Boolean.valueOf(Objects.equal(_iD, id));
      }
    };
    return IterableExtensions.<T>findFirst(this.elementos, _function);
  }
  
  @Pure
  public String getTipo() {
    return this.tipo;
  }
  
  public void setTipo(final String tipo) {
    this.tipo = tipo;
  }
  
  @Pure
  public Set<T> getElementos() {
    return this.elementos;
  }
  
  public void setElementos(final Set<T> elementos) {
    this.elementos = elementos;
  }
  
  @Pure
  public int getId() {
    return this.id;
  }
  
  public void setId(final int id) {
    this.id = id;
  }
}
