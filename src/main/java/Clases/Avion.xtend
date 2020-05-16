package Clases

import java.util.HashSet
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.mongodb.morphia.annotations.Embedded
import org.bson.types.ObjectId
import org.mongodb.morphia.annotations.Id
import Filtros.FiltrosAsiento

@Observable
@Accessors
class Avion {
	
	@Id ObjectId ID
	
	String nombre
	
	@Embedded
	Set<Asiento> asientos = new HashSet<Asiento>
	
	def seleccionarAsiento(String id){
		asientos.findFirst(it|it.ID == new ObjectId(id))
	}
	
	def recargoUltimosPasajes(){
		if(asientosDisponibles.length<=2){1.15}else{1}
	}
	
	def asientosDisponibles(){
		asientos.filter[it.habilitado].toList
	}
	
	def asientoMasBarato(){
		asientosDisponibles.minBy[precio]
	}
	
	def filtroAsientosVuelo(String claseAsiento, Boolean ventanilla){
		if(!claseAsiento.isNullOrEmpty){
			asientosDisponibles.exists[asiento | asiento.claseDeAsiento == claseAsiento && asiento.ventana == ventanilla]
		}else{
			asientosDisponibles.exists[asiento | asiento.ventana == ventanilla]
		}
	}
	
	def asientosFiltrados(FiltrosAsiento filtros) {
		if(filtros.claseAsiento !== ""){
			asientosDisponibles.filter[it.ventana == filtros.ventanilla && it.claseDeAsiento == filtros.claseAsiento].toSet
		}else{
			asientosDisponibles.filter[it.ventana == filtros.ventanilla].toSet
		}
	}
	
}