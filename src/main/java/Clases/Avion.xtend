package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Set
import java.util.HashSet

@Accessors
class Avion {
	String nombre
	
	Set<Asiento> asientos = new HashSet<Asiento>
	
	def recargoUltimosPasajes(){
		if(asientos.length<=2){1.15}else{1}
	}
	
	def asientosDisponibles(){
		asientos.filter[it.disponible == true].toList
	}
	
	def asientoMasBarato(){
		asientosDisponibles.minBy[precio]
	}
}