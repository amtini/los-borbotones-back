package Repositorio

import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root
import Clases.Ticket
import java.util.List

class RepositorioTicket extends Repositorio<Ticket>  {
	
	override getEntityType() {
		Ticket
	}
	
	override generateWhereId(CriteriaBuilder criteria, CriteriaQuery<Ticket> query, Root<Ticket> campos, Long id) {
		if (id !== null) { 
			query.where(criteria.equal(campos.get("ID"), id))
		} 
	}
	
	override fetch(Root<Ticket> from) {
	}
	
	def searchTicketByAsiento(String asientoId) {
		val entityManager = this.entityManager
		try {
			val criteria = entityManager.criteriaBuilder
			val query = criteria.createQuery(entityType)
			val from = query.from(entityType)
			query.select(from)
			query.where(criteria.equal(from.get("ID"), asientoId))
			entityManager.createQuery(query).singleResult
		} finally {
			entityManager?.close
		}
	}
	
	//REVISAR URGENTE
	//sirve para eliminar todos los tickets al realizar la accion LIMPIAR CARRITO
	
	/*def eliminarTickets(List<Ticket> tickets){
		tickets.forEach(ticket | delete(ticket.ID))
	}*/
	
}