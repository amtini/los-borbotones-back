package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Set
import java.util.HashSet
import App.FiltrosAsiento

@Accessors
class Avion {
	String nombre
	
	Set<Asiento> asientos = new HashSet<Asiento>
	
	def recargoUltimosPasajes(){
		if(asientosDisponibles.length<=2){1.15}else{1}
	}
	
	def asientosDisponibles(){
		asientos.filter[it.disponible].toList
	}
	
	def asientoMasBarato(){
		asientosDisponibles.minBy[precio]
	}
	
	def asientosFiltrados(FiltrosAsiento filtros) {
		if(filtros.claseAsiento !== ""){
			asientosDisponibles.filter[it.ventana == filtros.ventanilla && it.claseDeAsiento.nombre == filtros.claseAsiento].toSet
		}else{
			asientosDisponibles.filter[it.ventana == filtros.ventanilla].toSet
		}
	}
	
}