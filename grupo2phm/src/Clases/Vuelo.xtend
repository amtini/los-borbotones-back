package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import java.time.LocalDate
import Repositorio.Entidad
import java.time.temporal.ChronoUnit

@Accessors
class Vuelo implements Entidad{
	String id
	
	String ciudadDeOrigen
	String ciudadDeDestino
	LocalDate horarioDePartida
	LocalDate horarioDeLlegada
	Aerolinea aerolinea
	
	Avion avion
	
	Double precioBase
	
	override getID() {
		id
	}
	
	override setID(String idd) {
		id  = idd
	}
	
	def precioDeVuelo(){
		(precioBase + aerolinea.precioAsiento) * avion.recargoUltimosPasajes
	}
	
	def double duracionDeViaje(){
		ChronoUnit.HOURS.between(horarioDePartida,horarioDeLlegada)
	}
}