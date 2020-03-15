package Clases

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Reserva {
	Vuelo vuelo
	Asiento asiento
	
	new (Vuelo vuelo_, Asiento asiento_){
		vuelo = vuelo_
		asiento = asiento_
	}
	
	def costoTotal(){
		vuelo.precioDeVuelo + asiento.precio
	}
}