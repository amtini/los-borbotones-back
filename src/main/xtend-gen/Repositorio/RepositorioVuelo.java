package Repositorio;

import Clases.Vuelo;
import Repositorio.Repositorio;
import java.time.LocalDate;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;

@SuppressWarnings("all")
public class RepositorioVuelo extends Repositorio<Vuelo> {
  @Accessors
  private String tipo = "V";
  
  public List<Vuelo> vuelosDisponibles() {
    final Function1<Vuelo, Boolean> _function = new Function1<Vuelo, Boolean>() {
      public Boolean apply(final Vuelo vuelo) {
        int _size = IterableExtensions.size(vuelo.getAvion().asientosDisponibles());
        return Boolean.valueOf((_size > 0));
      }
    };
    return IterableExtensions.<Vuelo>toList(IterableExtensions.<Vuelo>filter(this.getElementos(), _function));
  }
  
  public List<Vuelo> buscarVuelos(final String origen, final String destino, final LocalDate desde, final LocalDate hasta) {
    final Function1<Vuelo, Boolean> _function = new Function1<Vuelo, Boolean>() {
      public Boolean apply(final Vuelo vuelo) {
        return Boolean.valueOf(vuelo.cumpleLosFiltros(origen, destino, desde, hasta));
      }
    };
    return IterableExtensions.<Vuelo>toList(IterableExtensions.<Vuelo>filter(this.vuelosDisponibles(), _function));
  }
  
  @Pure
  public String getTipo() {
    return this.tipo;
  }
  
  public void setTipo(final String tipo) {
    this.tipo = tipo;
  }
}
