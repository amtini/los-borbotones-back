package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Set
import java.util.HashSet

@Accessors
class Avion {
	String nombre
	
	
	Set<Asiento> asientosDisponibles = new HashSet<Asiento>
	
	def recargoUltimosPasajes(){
		if(asientosDisponibles.length<=2){1.15}else{1}
	}
}