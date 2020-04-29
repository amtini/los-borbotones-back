package Clases

import App.FiltrosAsiento
import java.util.HashSet
import java.util.Set
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.OneToMany
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import javax.persistence.GenerationType

@Entity
@Observable
@Accessors
class Avion {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	Long ID
	
	@Column(length=150)
	String nombre
	
	@OneToMany(fetch=FetchType.LAZY)
	Set<Asiento> asientos = new HashSet<Asiento>
	
	def recargoUltimosPasajes(){
		if(asientosDisponibles.length<=2){1.15}else{1}
	}
	
	def asientosDisponibles(){
		asientos.filter[it.habilitado].toList
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