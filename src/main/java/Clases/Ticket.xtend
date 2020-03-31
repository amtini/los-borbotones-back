package Clases

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ticket{
	
	Vuelo vuelo
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