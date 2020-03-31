package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.HashSet
import java.util.Set

@Accessors
class CarritoDeCompras {
	
	Set<Ticket> tickets = new HashSet<Ticket>
	
	def agregarTicketAlCarrito(Ticket ticket){
		tickets.add(ticket)
		ticket.reservar
	}
	
	def removerTicketDelCarrito(Vuelo vuelo, Asiento asiento){
		val ticket = this.buscarTicket(vuelo, asiento)
		tickets.remove(ticket)
		ticket.cancelarReserva
	}
	
	def buscarTicket(Vuelo vuelo, Asiento asiento){
		tickets.findFirst[it.vuelo == vuelo && it.asiento == asiento]
	}
	
	def limpiarCarritoDeCompras(){
		tickets.clear
	}
	
	def costoTotalDelCarrito(){
		tickets.fold(0.0, [acum, ticket | acum + ticket.costo])
	}
}