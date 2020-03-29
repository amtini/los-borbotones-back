package Repositorio

import Clases.Vuelo
import org.eclipse.xtend.lib.annotations.Accessors

class RepositorioVuelo extends Repositorio<Vuelo>{
	@Accessors String tipo = "V"
	
	def vuelosDisponibles(){
		elementos.filter[
			vuelo | vuelo.avion.asientosDisponibles.size > 0
		]
	}
}