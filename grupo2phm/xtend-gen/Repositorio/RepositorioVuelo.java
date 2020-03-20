package Repositorio;

import Clases.Vuelo;
import Repositorio.Repositorio;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class RepositorioVuelo extends Repositorio<Vuelo> {
  public Iterable<Vuelo> vuelosDisponibles() {
    final Function1<Vuelo, Boolean> _function = (Vuelo vuelo) -> {
      int _length = ((Object[])Conversions.unwrapArray(vuelo.getAvion().getAsientosDisponibles(), Object.class)).length;
      return Boolean.valueOf((_length > 0));
    };
    return IterableExtensions.<Vuelo>filter(this.getElementos(), _function);
  }
}
