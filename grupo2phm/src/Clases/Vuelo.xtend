package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.HashSet
import java.util.Set
import java.time.LocalDate
import Repositorio.Entidad

@Accessors
class Vuelo implements Entidad{
	String id
	
	Ruta ruta
	String ciudadDeOrigen
	String ciudadDeDestino
	Aerolinea aerolinea
	
	LocalDate horarioDePartida
	Avion avion
	
	Set<Asiento> asientosDisponibles = new HashSet<Asiento>
	
	Double precioBase
	
	override getID() {
		id
	}
	
	override setID(String idd) {
		id  = idd
	}
	
	def precioDeVuelo(){
		(precioBase + aerolinea.precioAsiento) * recargoUltimosPasajes
	}
	
	def recargoUltimosPasajes(){
		if(asientosDisponibles.length<=2){1.15}else{1}
	}
	
	def comprarPasaje(Asiento asientoAComprar){
		asientosDisponibles.remove(asientoAComprar)
	}
}