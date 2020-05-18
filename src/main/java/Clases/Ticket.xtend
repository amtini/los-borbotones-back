package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import RepositorioMongo.RepositorioVuelo

@Observable
@Accessors
class Ticket {

	new() {
	}

	String ID

	Vuelo vuelo

	Asiento asiento

	RepositorioVuelo repoVuelo = new RepositorioVuelo

	new(Vuelo vuelo_, Asiento asiento_) {
		vuelo = vuelo_
		asiento = asiento_
	}

	def reservar() {
		asiento.habilitado = false
	}

	def cancelarReserva() {
		val vueloSeleccionado = repoVuelo.searchByID(vuelo.ID.toString)
		vueloSeleccionado.avion.seleccionarAsiento(asiento.ID).habilitado = true
		repoVuelo.update(vueloSeleccionado)
	}

	def costo() {
		vuelo.precioDeVuelo + asiento.precio
	}
}
