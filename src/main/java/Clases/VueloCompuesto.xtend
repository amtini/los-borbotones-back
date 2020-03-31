package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import java.util.List
import java.time.temporal.ChronoUnit

@Accessors
class VueloCompuesto extends Vuelo{
	List<Vuelo> escalas = new ArrayList<Vuelo>
	
	override getDuracionDeVuelo(){
		//ChronoUnit.HOURS.between(escalas.head().horarioDePartida,escalas.last().horarioDeLlegada)
		escalas.fold(0.0, [acum, vuelo | acum + vuelo.duracionDeVuelo ])
	}
	
	override precioDeVuelo(){
		(precioBase + aerolinea.precioAsiento) * 0.9 * avion.recargoUltimosPasajes
		//TODO VER REUTILIZACION
	}
	

	override getCantidadEscalas(){
		escalas.size
	}
	
	def boolean tieneEscalas(){
		getCantidadEscalas > 1
	}
}