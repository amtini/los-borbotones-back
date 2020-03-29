package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import java.util.List
import java.time.temporal.ChronoUnit

@Accessors
class VueloCompuesto extends Vuelo{
	List<Vuelo> escalas = new ArrayList<Vuelo>
	
	def double getDuracionDeViaje(){
		ChronoUnit.HOURS.between(escalas.head().horarioDePartida,escalas.last().horarioDeLlegada)
	}
	
	def getPrecioDeVuelo(){
		(precioBase + aerolinea.precioAsiento) * 0.9 * avion.recargoUltimosPasajes
		//TODO VER REUTILIZACION
	}
	
	def ordenarSegunTiempo(){
		escalas.sortBy[horarioDePartida]
	}
	
	def cantidadDeEscalas(){
		escalas.size
	}
}