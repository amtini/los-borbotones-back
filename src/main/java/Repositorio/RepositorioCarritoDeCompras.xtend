package Repositorio

import Clases.CarritoDeCompras
import org.eclipse.xtend.lib.annotations.Accessors

class RepositorioCarritoDeCompras extends Repositorio<CarritoDeCompras> {
	
	@Accessors String tipo = "C"
	
	private new() {
	}
	
	static RepositorioCarritoDeCompras instance

	static def getInstance() {
		if (instance === null) {
			instance = new RepositorioCarritoDeCompras()
		}
		instance
	}
	
	override getTipo() {
		return tipo
	}
	
	override condicionDeBusqueda(CarritoDeCompras cc, String value) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
