package Repositorio

import Clases.Vuelo
import org.eclipse.xtend.lib.annotations.Accessors
import App.FiltrosVuelo

class RepositorioVuelo extends Repositorio<Vuelo>{
	@Accessors String tipo = "V"
	
	def vuelosDisponibles(){
		elementos.filter[
			vuelo | vuelo.avion.asientosDisponibles.size > 0
		].toList
	}
	
	def vuelosFiltrados(FiltrosVuelo filtros) {
		vuelosDisponibles.filter[ vuelo | vuelo.cumpleLosFiltros(filtros.origen, filtros.destino , filtros.desde, filtros.hasta, filtros.ventanilla, filtros.claseAsiento)].toSet
	}
	
}