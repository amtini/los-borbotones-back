package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import java.time.LocalDate
import java.time.temporal.ChronoUnit
import Repositorio.Entidad

@Accessors
class Ruta implements Entidad{
	String id
	
	String ciudadDeOrigen
	String ciudadDeDestino
	LocalDate horarioDePartida
	LocalDate horarioDeLlegada
	
	def duracionDeViaje(){
		ChronoUnit.HOURS.between(horarioDePartida,horarioDeLlegada)
	}
	
	override getID() {
		id
	}
	
	override setID(String idd) {
		id  = idd
	}
	
}