package Repositorio

import Clases.Vuelo

class RepositorioVuelo extends Repositorio<Vuelo>{
	
	
	def vuelosDisponibles(){
		elementos.filter[
			vuelo | vuelo.avion.asientosDisponibles.length > 0
		]
	}
}