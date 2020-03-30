package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class CarritoDeCompras {
	
	List<Ticket> tickets = new ArrayList<Ticket>
	
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
	
	def costoTotalDelCarrito(){
		tickets.fold(0.0, [acum, ticket | acum + ticket.costo])
	}
}