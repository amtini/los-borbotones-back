package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import java.util.List
import org.uqbar.commons.model.annotations.Observable
import Repositorio.Entidad

@Observable
@Accessors
class CarritoDeCompras implements Entidad {

	new(String _ID) {
		ID=_ID
	}

	String ID

	override getID() {
		return ID
	}

	override setID(String id) {
		ID = id
	}

	List<Ticket> tickets = new ArrayList<Ticket>

	def agregarTicketAlCarrito(Vuelo vuelo, Asiento asiento) {
		val ticket = new Ticket(vuelo, asiento)
		if (!existeEnCarrito(vuelo, asiento)) {
			tickets.add(ticket)
			ticket.reservar() // TODO
		}
	}

	def removerTicketDelCarrito(Ticket ticket) {
		tickets.remove(ticket)
		ticket.cancelarReserva()
	}

	def buscarTicket(Vuelo vuelo, Asiento asiento) {
		tickets.findFirst[it.vuelo.ID == vuelo.ID && it.asiento.ID == asiento.ID]
	}

	def existeEnCarrito(Vuelo vuelo, Asiento asiento) {
		tickets.contains(buscarTicket(vuelo, asiento))
	}

	def limpiarCarritoDeCompras() {
		tickets.clear
	}

	def cancelarReservaDeTodosLosAsientos() {
		tickets.forEach(ticket|ticket.cancelarReserva)
	}

	def double costoTotalDelCarrito() {
		tickets.fold(0.0, [acum, ticket|acum + ticket.costo])
	}
}
