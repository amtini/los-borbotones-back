package Clases

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ticket{
	
	Vuelo vuelo
	Asiento asiento
	
	def reservar(){
		asiento.disponible = false
	}
	
	def cancelarReserva(){
		asiento.disponible = true
	}
	
	def costo(){
		vuelo.precioDeVuelo + asiento.claseDeAsiento.precioClase
	}
}