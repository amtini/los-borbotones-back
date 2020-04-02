package Repositorio

import Clases.Vuelo
import org.eclipse.xtend.lib.annotations.Accessors
import App.FiltrosVuelo
import App.FiltrosAsiento

class RepositorioVuelo extends Repositorio<Vuelo>{
	@Accessors String tipo = "V"
	
	def vuelosDisponibles(){
		elementos.filter[
			vuelo | vuelo.avion.asientosDisponibles.size > 0
		].toList
	}
	
	def vuelosFiltrados(FiltrosVuelo filtros) {
		vuelosDisponibles.filter[ vuelo | vuelo.cumpleLosFiltros(filtros)].toSet
	}
	
	def asientosDeMiVuelo(String id, FiltrosAsiento filtros) {
		searchByID(id).dameAsientos(filtros)
	}
	
}