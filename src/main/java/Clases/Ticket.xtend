package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import com.fasterxml.jackson.annotation.JsonProperty

@Accessors
class Ticket{
	
	Vuelo vuelo
	Asiento asiento
	
	new(Vuelo vuelo_, Asiento asiento_) {
		vuelo = vuelo_
		asiento = asiento_
	}
	
	@JsonProperty def reservar(){
		asiento.disponible = false
	}
	
	@JsonProperty def cancelarReserva(){
		asiento.disponible = true
	}
	
	@JsonProperty def costo(){
		vuelo.precioDeVuelo + asiento.precio
	}
}