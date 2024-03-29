package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import java.util.List
import javax.persistence.OneToMany
import javax.persistence.FetchType
import javax.persistence.Entity
import org.uqbar.commons.model.annotations.Observable
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.GenerationType
import javax.persistence.CascadeType

@Entity
@Observable
@Accessors
class CarritoDeCompras {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	Long ID

	@OneToMany(fetch=FetchType.LAZY, cascade = CascadeType.ALL)
	List<Ticket> tickets = new ArrayList<Ticket>
	
	def agregarTicketAlCarrito(Vuelo vuelo, Asiento asiento){		
		val ticket = new Ticket(vuelo,asiento)
		if(!existeEnCarrito(vuelo,asiento)){
			tickets.add(ticket)
			ticket.reservar //TODO
		}
	}
	
	def removerTicketDelCarrito(Ticket ticket){	
		tickets.remove(ticket)
	}
	
	def buscarTicket(Vuelo vuelo, Asiento asiento){
		tickets.findFirst[it.vuelo.ID == vuelo.ID && it.asiento.ID == asiento.ID]
	}
	
	def existeEnCarrito(Vuelo vuelo, Asiento asiento){
		tickets.contains(buscarTicket(vuelo, asiento))
	}
	
	def limpiarCarritoDeCompras(){
		tickets.clear
	}
	
	def cancelarReservaDeTodosLosAsientos(){
		tickets.forEach(ticket | ticket.cancelarReserva)
	}
	
	def double costoTotalDelCarrito(){
		tickets.fold(0.0, [acum, ticket | acum + ticket.costo])
	}
}