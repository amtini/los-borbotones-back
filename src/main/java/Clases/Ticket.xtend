package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import javax.persistence.FetchType
import javax.persistence.OneToOne
import javax.persistence.Entity
import org.uqbar.commons.model.annotations.Observable
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.GenerationType

@Entity
@Observable
@Accessors
class Ticket{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	Long ID
	
	@OneToOne(fetch=FetchType.LAZY)
	Vuelo vuelo
	@OneToOne(fetch=FetchType.LAZY)
	Asiento asiento
	
	new(Vuelo vuelo_, Asiento asiento_) {
		vuelo = vuelo_
		asiento = asiento_
	}
	
	def reservar(){
		asiento.disponible = false
	}
	
	def cancelarReserva(){
		asiento.disponible = true
	}
	
	def costo(){
		vuelo.precioDeVuelo + asiento.precio
	}
}