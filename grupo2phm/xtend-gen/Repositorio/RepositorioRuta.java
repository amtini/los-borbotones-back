package Repositorio;

import Clases.Ruta;
import Repositorio.Repositorio;
import org.eclipse.xtend.lib.annotations.Accessors;

@Accessors
@SuppressWarnings("all")
public class RepositorioRuta extends Repositorio<Ruta> {
  @Override
  public boolean condicionDeBusqueda(final Ruta el, final String value) {
    throw new UnsupportedOperationException("TODO: auto-generated method stub");
  }
}
