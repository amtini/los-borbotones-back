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
	
	def removerTicketDelCarrito(Ticket ticket){
		tickets.remove(ticket)
		ticket.cancelarReserva
	}
	
	def costoTotalDelCarrito(){
		tickets.fold(0.0, [acum, ticket | acum + ticket.costo])
	}
}