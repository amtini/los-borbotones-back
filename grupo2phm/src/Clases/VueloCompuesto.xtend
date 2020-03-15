package Clases

import java.util.Set
import java.util.HashSet
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class VueloCompuesto extends Vuelo{
	Set<Ruta> escalas = new HashSet<Ruta>
	
	def getDuracionDeViaje(){
		escalas.fold(0.0, [acum, ruta|acum + ruta.duracionDeViaje])
	}
	
	override precioDeVuelo(){
		(precioBase + aerolinea.precioAsiento) * 0.9
	}
	
	def tiempoEntreVuelos(){

		//definir
	}
	
	def ordenarSegunTiempo(){
		escalas.sortBy[horarioDePartida]
	}
}