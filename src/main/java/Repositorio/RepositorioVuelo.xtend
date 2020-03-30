package Repositorio

import Clases.Vuelo
import org.eclipse.xtend.lib.annotations.Accessors
import java.time.LocalDate

class RepositorioVuelo extends Repositorio<Vuelo>{
	@Accessors String tipo = "V"
	
	def vuelosDisponibles(){
		elementos.filter[
			vuelo | vuelo.avion.asientosDisponibles.size > 0
		].toList
	}
	
	def buscarVuelos(String origen, String destino, LocalDate desde, LocalDate hasta){
		vuelosDisponibles.filter[ vuelo | vuelo.cumpleLosFiltros(origen, destino, desde, hasta)].toList
	}
}