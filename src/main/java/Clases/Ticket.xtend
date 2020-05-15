package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class Ticket {

	new() {
	}

	String ID

	Vuelo vuelo

	Asiento asiento

	new(Vuelo vuelo_, Asiento asiento_) {
		vuelo = vuelo_
		asiento = asiento_
	}

	def reservar() {
		asiento.habilitado = false
	}

	def cancelarReserva() {
		asiento.habilitado = true
	}

	def costo() {
		vuelo.precioDeVuelo + asiento.precio
	}
}
